-- Run this in your Supabase SQL Editor
-- Go to: https://supabase.com/dashboard → your project → SQL Editor → New query

CREATE TABLE IF NOT EXISTS sugar_logs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  level NUMERIC NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('Fasting', 'Before Meal', 'After Meal', 'Random')),
  meal TEXT NOT NULL DEFAULT 'None',
  datetime TIMESTAMPTZ NOT NULL,
  notes TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for fast sorting by datetime
CREATE INDEX IF NOT EXISTS idx_sugar_logs_datetime ON sugar_logs(datetime DESC);

-- Enable Row Level Security (RLS)
ALTER TABLE sugar_logs ENABLE ROW LEVEL SECURITY;

-- Allow all operations for anonymous users (no login required)
CREATE POLICY "Allow all for anon" ON sugar_logs
  FOR ALL
  TO anon
  USING (true)
  WITH CHECK (true);
