
-- FIX: Add missing updated_at column to ordenes table
-- This resolves PGRST204 errors when the client sends updated_at

ALTER TABLE "public"."ordenes" 
ADD COLUMN IF NOT EXISTS "updated_at" timestamp with time zone DEFAULT now();

COMMENT ON COLUMN "public"."ordenes"."updated_at" IS 'Timestamp de última actualización (Fix 400 Error)';
