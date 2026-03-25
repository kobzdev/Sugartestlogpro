# 🩸 Sugar Test Log Pro v2

Blood sugar tracking app with **admin panel**, **deletion history**, and **date-range export**.

---

## What's new in v2

| Feature | Public users | Admin only |
|---|---|---|
| Log new readings | ✅ | ✅ |
| View all logs | ✅ | ✅ |
| Dashboard & insights | ✅ | ✅ |
| Edit entries | ❌ | ✅ |
| Delete entries | ❌ | ✅ |
| Export CSV (date range) | ❌ | ✅ |
| View deletion history | ❌ | ✅ |

---

## 🚀 Setup (3 steps)

### 1. Supabase

1. Go to [supabase.com](https://supabase.com) → New Project
2. **SQL Editor → New query** → paste & run `supabase-schema.sql`
3. **Project Settings → API** → copy:
   - Project URL
   - `anon` / public key

### 2. Vercel Environment Variables

In your Vercel project → **Settings → Environment Variables**, add:

| Variable | Value |
|---|---|
| `VITE_SUPABASE_URL` | `https://xxxx.supabase.co` |
| `VITE_SUPABASE_ANON_KEY` | `eyJ...` |
| `VITE_ADMIN_PASSWORD` | `your-secret-password` |

> ⚠️ **Choose a strong admin password.** Anyone who knows it can delete data.

### 3. Deploy

Push to GitHub → Vercel auto-deploys. Done ✅

---

## 💻 Local Development

```bash
cp .env.example .env
# fill in your values in .env

npm install
npm run dev
```

---

## 🔐 Admin Access

- Click the **🔐 lock icon** in the top-right corner
- Enter your admin password
- Admin session persists until you close the browser tab or click **Logout**
- Only admins can edit, delete, or export entries

## 🗑️ Deletion History

Every deletion records:
- Date & time of deletion
- Who deleted (admin)
- Reason selected + optional notes
- Date range affected
- Full snapshot of every deleted entry (level, type, meal, datetime)

This cannot be cleared from the UI — it's a permanent audit trail in Supabase.

---

## 📁 Project Structure

```
sugar-log-v2/
├── index.html           ← Entire app
├── supabase-schema.sql  ← Run once in Supabase SQL Editor
├── .env.example         ← Copy to .env and fill in values
├── package.json
├── vite.config.js
└── .gitignore
```
