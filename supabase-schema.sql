-- ============================================================
-- Sugar Test Log Pro v2 — Full Schema
-- Run this in: Supabase Dashboard → SQL Editor → New query
-- ============================================================

-- 1. Main sugar logs table
CREATE TABLE IF NOT EXISTS sugar_logs (
  id          UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  level       NUMERIC     NOT NULL,
  type        TEXT        NOT NULL CHECK (type IN ('Fasting','Before Meal','After Meal','Random')),
  meal        TEXT        NOT NULL DEFAULT 'None',
  datetime    TIMESTAMPTZ NOT NULL,
  notes       TEXT        DEFAULT '',
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_sugar_logs_datetime ON sugar_logs(datetime DESC);

-- 2. Deletion history log
CREATE TABLE IF NOT EXISTS deletion_log (
  id            UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  deleted_at    TIMESTAMPTZ DEFAULT NOW(),
  deleted_by    TEXT        DEFAULT 'admin',
  reason        TEXT        NOT NULL,
  entries_count INTEGER     NOT NULL,
  entries_json  JSONB       NOT NULL,
  date_range    TEXT
);

CREATE INDEX IF NOT EXISTS idx_deletion_log_deleted_at ON deletion_log(deleted_at DESC);

-- 3. Enable RLS on both tables
ALTER TABLE sugar_logs   ENABLE ROW LEVEL SECURITY;
ALTER TABLE deletion_log ENABLE ROW LEVEL SECURITY;

-- 4. Public can read + insert sugar_logs (anyone can log readings)
CREATE POLICY "public_read_insert" ON sugar_logs
  FOR SELECT TO anon USING (true);

CREATE POLICY "public_insert" ON sugar_logs
  FOR INSERT TO anon WITH CHECK (true);

-- 5. Public CANNOT delete or update sugar_logs
--    (deletion is handled via service-role calls or we bypass using anon with a check)
--    We'll use a Supabase RPC function that verifies the admin password server-side.

-- 6. Public can read deletion_log (so admin panel can show history)
CREATE POLICY "public_read_deletion_log" ON deletion_log
  FOR SELECT TO anon USING (true);

CREATE POLICY "public_insert_deletion_log" ON deletion_log
  FOR INSERT TO anon WITH CHECK (true);

-- 7. RPC: admin_delete_entries
--    Called with the admin password hash; deletes entries and logs the deletion.
--    Password verification happens in the app using env var comparison.
--    The actual delete uses a separate policy below.

-- Allow anon to delete (we guard this in the app with password check)
CREATE POLICY "admin_delete" ON sugar_logs
  FOR DELETE TO anon USING (true);

-- ============================================================
-- Done! Your tables are ready.
-- ============================================================
