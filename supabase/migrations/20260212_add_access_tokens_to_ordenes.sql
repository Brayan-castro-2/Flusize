-- Add access token columns to ordenes table for public tracking
-- Migration: 20260212_add_access_tokens_to_ordenes

-- Add access_token column (8-16 character hex string)
ALTER TABLE ordenes ADD COLUMN IF NOT EXISTS access_token VARCHAR(16);

-- Add timestamp for when token was created
ALTER TABLE ordenes ADD COLUMN IF NOT EXISTS token_created_at TIMESTAMP;

-- Add timestamp for last time order was viewed publicly
ALTER TABLE ordenes ADD COLUMN IF NOT EXISTS last_public_view TIMESTAMP;

-- Create index on access_token for faster lookups
CREATE INDEX IF NOT EXISTS idx_ordenes_access_token ON ordenes(access_token);

-- Add comment explaining the columns
COMMENT ON COLUMN ordenes.access_token IS 'Unique token for public order tracking without login';
COMMENT ON COLUMN ordenes.token_created_at IS 'When the access token was generated';
COMMENT ON COLUMN ordenes.last_public_view IS 'Last time the order was viewed via public link';
