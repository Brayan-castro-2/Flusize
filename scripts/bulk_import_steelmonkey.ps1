# bulk_import_steelmonkey.ps1
# Importación masiva de datos Clean Slate V3 usando Supabase REST API
# Ejecutar desde el root del proyecto Flusize

# Leer variables de entorno desde .env.local
$projectRoot = 'c:\Users\FLUSIZE\Documents\GitHub\Flusize'
$envContent = Get-Content "$projectRoot\.env.local" -Encoding UTF8
$supabaseUrl = ($envContent | Where-Object { $_ -match "^NEXT_PUBLIC_SUPABASE_URL=" }) -replace "^NEXT_PUBLIC_SUPABASE_URL=", ""
$serviceKey = ($envContent | Where-Object { $_ -match "^SUPABASE_SERVICE_ROLE_KEY=" }) -replace "^SUPABASE_SERVICE_ROLE_KEY=", ""

if (-not $supabaseUrl -or -not $serviceKey) {
    Write-Error "No se encontraron las variables de Supabase en .env.local"
    exit 1
}

Write-Host "Supabase URL: $supabaseUrl"
Write-Host "Service key encontrado: $($serviceKey.Length) chars"

$csv = Import-Csv -Path "$projectRoot\FLUSIZE_V3_CLEAN_SLATE_FILTERED.csv" -Encoding UTF8
$TALLER_ID = 'e55ce6be-7b8c-4a1a-b333-666333666333'
Write-Host "Filas CSV: $($csv.Count)"

$headers = @{
    "apikey"        = $serviceKey
    "Authorization" = "Bearer $serviceKey"
    "Content-Type"  = "application/json"
    "Prefer"        = "return=minimal"
}

function PostBatch($table, $body) {
    $url = "$supabaseUrl/rest/v1/$table"
    $json = $body | ConvertTo-Json -Depth 3 -Compress
    try {
        $resp = Invoke-WebRequest -Uri $url -Method POST -Headers $headers -Body $json -UseBasicParsing -ErrorAction Stop
        Write-Host "  OK ($table) status: $($resp.StatusCode)"
        return $true
    }
    catch {
        Write-Error "  ERROR ($table): $($_.Exception.Message)"
        return $false
    }
}

# ============================
# PASO 1: Insertar CLIENTES
# ============================
Write-Host "`n--- CLIENTES ---"
$clientesDict = @{}
$clientesArr = [System.Collections.Generic.List[object]]::new()

foreach ($row in $csv) {
    $nombre = $row.cliente_nombre.Trim()
    $rut = $row.cliente_rut.Trim()
    $tel = $row.cliente_telefono.Trim()
    $key = "$nombre|$rut"
    if (-not $clientesDict.ContainsKey($key)) {
        $cid = [System.Guid]::NewGuid().ToString()
        $clientesDict[$key] = $cid
        $obj = @{ id = $cid; taller_id = $TALLER_ID; nombre_completo = $nombre }
        if ($rut) { $obj.rut_dni = $rut }
        if ($tel) { $obj.telefono = $tel }
        $clientesArr.Add($obj)
    }
}

Write-Host "Clientes a insertar: $($clientesArr.Count)"
$batchSize = 200
for ($i = 0; $i -lt $clientesArr.Count; $i += $batchSize) {
    $batch = $clientesArr[$i..[Math]::Min($i + $batchSize - 1, $clientesArr.Count - 1)]
    Write-Host "  Insertando clientes $i - $($i+$batch.Count)..."
    PostBatch "clientes" $batch | Out-Null
    Start-Sleep -Milliseconds 200
}

# ============================
# PASO 2: Insertar VEHICULOS
# ============================
Write-Host "`n--- VEHICULOS ---"
$vehiculosDict = @{}
$vehiculosArr = [System.Collections.Generic.List[object]]::new()

foreach ($row in $csv) {
    $nombre = $row.cliente_nombre.Trim()
    $rut = $row.cliente_rut.Trim()
    $cid = $clientesDict["$nombre|$rut"]
    $pat = $row.patente_vehiculo.Trim().ToUpper()
    if ($pat.Length -gt 2 -and -not $vehiculosDict.ContainsKey($pat)) {
        $vid = [System.Guid]::NewGuid().ToString()
        $vehiculosDict[$pat] = $vid
        $anoRaw = ($row.vehiculo_anio -replace "[^0-9]", "").Trim()
        $kmRaw = ($row.kilometraje -replace "[^0-9]", "").Trim()
        $obj = @{ id = $vid; taller_id = $TALLER_ID; cliente_id = $cid; patente = $pat }
        if ($row.vehiculo_marca.Trim()) { $obj.marca = $row.vehiculo_marca.Trim() }
        if ($row.vehiculo_modelo.Trim()) { $obj.modelo = $row.vehiculo_modelo.Trim() }
        if ($row.vehiculo_color.Trim()) { $obj.color = $row.vehiculo_color.Trim() }
        if ($anoRaw) { $obj.ano = [int]$anoRaw }
        if ($kmRaw) { $obj.kilometraje = [int]$kmRaw }
        $vehiculosArr.Add($obj)
    }
}

Write-Host "Vehículos a insertar: $($vehiculosArr.Count)"
for ($i = 0; $i -lt $vehiculosArr.Count; $i += $batchSize) {
    $batch = $vehiculosArr[$i..[Math]::Min($i + $batchSize - 1, $vehiculosArr.Count - 1)]
    Write-Host "  Insertando vehículos $i - $($i+$batch.Count)..."
    PostBatch "vehiculos" $batch | Out-Null
    Start-Sleep -Milliseconds 200
}

# ============================
# PASO 3: Insertar ORDENES
# ============================
Write-Host "`n--- ORDENES ---"
$ordenesArr = [System.Collections.Generic.List[object]]::new()

foreach ($row in $csv) {
    $nombre = $row.cliente_nombre.Trim()
    $rut = $row.cliente_rut.Trim()
    $cid = $clientesDict["$nombre|$rut"]
    $pat = $row.patente_vehiculo.Trim().ToUpper()
    $vid = if ($pat.Length -gt 2 -and $vehiculosDict.ContainsKey($pat)) { $vehiculosDict[$pat] } else { $null }
    $ot = $row.numero_orden.Trim()
    if ($ot.EndsWith('.0')) { $ot = $ot.Substring(0, $ot.Length - 2) }
    if (-not $ot) { continue }
    
    $detalle = $row.detalle_trabajos.Trim()
    if ($detalle.Length -gt 800) { $detalle = $detalle.Substring(0, 800) }
    $precRaw = ($row.precio_total -replace "[^0-9]", "").Trim()
    $precio = if ($precRaw) { [int]$precRaw } else { 0 }
    $fecha = $row.fecha_ingreso.Trim()
    if (-not $fecha) { $fecha = "2026-01-01T00:00:00Z" }
    $estado = $row.estado.Trim().ToLower()
    if (-not $estado) { $estado = "completada" }
    
    $obj = @{
        id                  = [System.Guid]::NewGuid().ToString()
        taller_id           = $TALLER_ID
        cliente_id          = $cid
        numero_orden        = $ot
        descripcion_ingreso = ($detalle.Substring(0, [Math]::Min($detalle.Length, 200)))
        detalle_trabajos    = $detalle
        precio_total        = $precio
        estado              = $estado
        fecha_ingreso       = $fecha
    }
    if ($pat.Length -gt 2) { $obj.patente_vehiculo = $pat }
    if ($vid) { $obj.vehiculo_local_id = $vid }
    $ordenesArr.Add($obj)
}

Write-Host "Órdenes a insertar: $($ordenesArr.Count)"
$batchSize = 100
for ($i = 0; $i -lt $ordenesArr.Count; $i += $batchSize) {
    $batch = $ordenesArr[$i..[Math]::Min($i + $batchSize - 1, $ordenesArr.Count - 1)]
    Write-Host "  Insertando órdenes $i - $($i+$batch.Count)..."
    PostBatch "ordenes" $batch | Out-Null
    Start-Sleep -Milliseconds 300
}

Write-Host "`n==========================="
Write-Host "IMPORTACION COMPLETADA"
Write-Host "Clientes: $($clientesDict.Count)"
Write-Host "Vehículos: $($vehiculosDict.Count)"
Write-Host "Órdenes: $($ordenesArr.Count)"
Write-Host "==========================="
