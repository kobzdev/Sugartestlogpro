# 🩸 Sugar Test Log Pro

A mobile-first blood sugar tracking web app with Supabase backend.

**Features:** Offline-capable · Cloud sync · Dark mode · Smart insights · CSV export · Bulk delete · Search & filter

---

## 🚀 Setup in 4 Steps

### Step 1 — Create a Supabase project (free)

1. Go to [supabase.com](https://supabase.com) and sign up
2. Click **New Project**, give it a name (e.g. `sugar-log-pro`)
3. Choose a region close to you (e.g. Southeast Asia)
4. Wait ~2 minutes for it to provision

### Step 2 — Create the database table

1. In your Supabase dashboard, go to **SQL Editor** → **New query**
2. Paste and run the contents of `supabase-schema.sql`
3. You should see: `Success. No rows returned`

### Step 3 — Get your API keys

1. In Supabase, go to **Project Settings** → **API**
2. Copy:
   - **Project URL** (looks like `https://abcxyz.supabase.co`)
   - **anon/public key** (long string starting with `eyJ...`)

### Step 4 — Deploy to Vercel

1. Push this repo to GitHub
2. Go to [vercel.com](https://vercel.com) → **New Project** → Import your repo
3. In the **Environment Variables** section, add:
   - `VITE_SUPABASE_URL` = your Project URL
   - `VITE_SUPABASE_ANON_KEY` = your anon key
4. Click **Deploy** ✅

---

## 💻 Local Development

```bash
# 1. Install dependencies
npm install

# 2. Create your .env file
cp .env.example .env
# Then edit .env and fill in your Supabase URL and key

# 3. Run dev server
npm run dev

# 4. Build for production
npm run build
```

---

## 📁 Project Structure

```
sugar-log-pro/
├── index.html          ← The entire app (single file)
├── src/
│   └── supabase.js     ← Supabase client (used by Vite build)
├── supabase-schema.sql ← Run this once in Supabase SQL Editor
├── .env.example        ← Copy to .env and fill in your keys
├── .gitignore
├── package.json
└── vite.config.js
```

---

## 🔐 Note on Security

This app uses **anon/public** Supabase keys with Row Level Security (RLS) enabled. It's designed as a personal single-user app — no login required.

If you want to add authentication in the future, Supabase supports email/password, Google, and more out of the box.

---

## 📱 Install as PWA (Add to Home Screen)

In Chrome/Safari on mobile:
- Open your Vercel URL
- Tap **Share** → **Add to Home Screen**
- It will behave like a native app!
