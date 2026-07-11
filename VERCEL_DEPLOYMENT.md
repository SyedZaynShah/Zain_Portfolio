# Vercel Deployment Guide for Zain Shah Portfolio

## ✅ Your Setup is Correct!

Your Flutter app is properly configured to read EmailJS credentials from environment variables:

```dart
// lib/core/services/email_service.dart
static const String _serviceId = String.fromEnvironment('EMAILJS_SERVICE_ID');
static const String _templateId = String.fromEnvironment('EMAILJS_TEMPLATE_ID');
static const String _publicKey = String.fromEnvironment('EMAILJS_PUBLIC_KEY');
```

And your `vercel_build.sh` correctly passes them during build:

```bash
flutter build web --release \
  --dart-define=EMAILJS_SERVICE_ID="${EMAILJS_SERVICE_ID:-}" \
  --dart-define=EMAILJS_TEMPLATE_ID="${EMAILJS_TEMPLATE_ID:-}" \
  --dart-define=EMAILJS_PUBLIC_KEY="${EMAILJS_PUBLIC_KEY:-}"
```

---

## 🚀 Step-by-Step Vercel Deployment

### Step 1: Push to GitHub (Already Done ✅)

Your code is already on GitHub: https://github.com/SyedZaynShah/Zain_Portfolio

### Step 2: Connect to Vercel

1. Go to [vercel.com](https://vercel.com)
2. Click **"Sign Up"** or **"Log In"**
3. Choose **"Continue with GitHub"**
4. Authorize Vercel to access your GitHub account

### Step 3: Import Your Project

1. Click **"Add New..."** → **"Project"**
2. You'll see a list of your GitHub repositories
3. Find **"Zain_Portfolio"**
4. Click **"Import"**

### Step 4: Configure Build Settings

Vercel will auto-detect your settings from `vercel.json`. You should see:

- **Framework Preset:** Other
- **Build Command:** `bash vercel_build.sh`
- **Output Directory:** `build/web`
- **Install Command:** `echo 'no npm install needed'`

✅ **Leave these as-is** - they're correct!

### Step 5: Add Environment Variables (CRITICAL!)

Before deploying, you **must** add your EmailJS credentials:

1. Scroll down to **"Environment Variables"** section
2. Add three variables:

#### Variable 1:
- **Name:** `EMAILJS_SERVICE_ID`
- **Value:** `service_xqpd8sa`
- **Environment:** Production, Preview, Development (check all three)

#### Variable 2:
- **Name:** `EMAILJS_TEMPLATE_ID`
- **Value:** `template_raxablt`
- **Environment:** Production, Preview, Development (check all three)

#### Variable 3:
- **Name:** `EMAILJS_PUBLIC_KEY`
- **Value:** `Pjm_6UO0IBOtWts5p`
- **Environment:** Production, Preview, Development (check all three)

### Step 6: Deploy!

1. Click **"Deploy"**
2. Wait 3-5 minutes for the build to complete
3. Your site will be live!

---

## 🎯 Your Live URLs

After deployment:

- **Production:** `https://zain-portfolio.vercel.app`
- **Custom Domain (optional):** Add your own domain in Vercel settings

---

## 🔍 Verify EmailJS is Working

After deployment:

1. Visit your live site
2. Scroll to the contact form (04 / CONTACT)
3. Fill out the form with test data:
   - Name: Test User
   - Email: test@example.com
   - Message: Testing contact form
4. Click "Send Message"
5. You should see: ✅ "Message sent — I'll get back to you soon"
6. Check your Gmail: `sayedzaynshah@gmail.com`

If it says "Email client opened with your message" instead, the environment variables weren't set correctly.

---

## 📝 Environment Variables Screenshot Guide

When adding environment variables in Vercel, your screen should look like this:

```
┌─────────────────────────────────────────────────┐
│ Environment Variables                           │
├─────────────────────────────────────────────────┤
│                                                 │
│ Name:  EMAILJS_SERVICE_ID                      │
│ Value: service_xqpd8sa                         │
│ [✓] Production [✓] Preview [✓] Development    │
│                                                 │
├─────────────────────────────────────────────────┤
│                                                 │
│ Name:  EMAILJS_TEMPLATE_ID                     │
│ Value: template_raxablt                        │
│ [✓] Production [✓] Preview [✓] Development    │
│                                                 │
├─────────────────────────────────────────────────┤
│                                                 │
│ Name:  EMAILJS_PUBLIC_KEY                      │
│ Value: Pjm_6UO0IBOtWts5p                       │
│ [✓] Production [✓] Preview [✓] Development    │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## 🔄 Automatic Deployments

Once connected, Vercel will automatically:
- Deploy every push to `main` branch
- Create preview deployments for pull requests
- Use the environment variables you configured

---

## 🛠️ Troubleshooting

### Contact Form Falls Back to Mailto

**Problem:** Form opens email client instead of sending via EmailJS

**Solution:** Environment variables weren't set or are incorrect

1. Go to your project in Vercel
2. Settings → Environment Variables
3. Verify all three variables exist and have correct values
4. Redeploy: Deployments → ⋯ (three dots) → Redeploy

### Build Fails

**Problem:** Build fails with Flutter errors

**Solution:** Check build logs

1. Go to Deployments tab
2. Click the failed deployment
3. Check "Building" logs for errors
4. Common issues:
   - Flutter version mismatch (should auto-resolve)
   - Missing dependencies (should auto-resolve)

### 404 Errors on Routes

**Problem:** Routes like `/work/modchat` show 404

**Solution:** This shouldn't happen - `vercel.json` has SPA rewrites

If it does:
1. Settings → General → Framework Preset
2. Change to "Other"
3. Redeploy

---

## 🎨 Custom Domain Setup (Optional)

### Add Your Own Domain

1. Buy a domain (Namecheap, Google Domains, etc.)
2. In Vercel: Settings → Domains
3. Add your domain (e.g., `zainshah.dev`)
4. Follow DNS configuration instructions
5. Wait for DNS propagation (5-60 minutes)

### Recommended Domains

- `zainshah.dev` - Professional
- `zainshah.io` - Tech-focused
- `zainportfolio.com` - Clear purpose
- `builtzain.com` - Creative

---

## 📊 Post-Deployment Checklist

After your site is live:

- [ ] Test contact form (send test email)
- [ ] Check all sections load correctly
- [ ] Verify ModChat project page works
- [ ] Test "Download Resume" button
- [ ] Check social links (GitHub, LinkedIn, Instagram)
- [ ] Test on mobile devices
- [ ] Share link with friends for feedback
- [ ] Add to resume and LinkedIn
- [ ] Submit to [Portfolio Club](https://www.portfolio.club/)

---

## 🔗 Important Links

- **Your GitHub Repo:** https://github.com/SyedZaynShah/Zain_Portfolio
- **Vercel Dashboard:** https://vercel.com/dashboard
- **Vercel Docs:** https://vercel.com/docs

---

## 🎯 What Happens During Build

1. Vercel clones your GitHub repo
2. Runs `vercel_build.sh`
3. Script downloads Flutter SDK (3.44.2)
4. Runs `flutter build web --release` with your EmailJS credentials
5. Optimizes build (removes unused files)
6. Deploys to Vercel's global CDN
7. Your site is live in ~5 minutes!

---

## 💡 Pro Tips

1. **Enable Preview Deployments:** Every branch gets its own URL for testing
2. **Analytics:** Enable Vercel Analytics in project settings (free)
3. **Speed Insights:** Monitor performance with Vercel Speed Insights
4. **Branch Protection:** In GitHub settings, protect `main` branch
5. **Git Workflow:**
   ```bash
   # Make changes
   git add .
   git commit -m "Update: description"
   git push
   # Vercel auto-deploys!
   ```

---

## 🚨 Remember

**Your EmailJS credentials are:**
- Service ID: `service_xqpd8sa`
- Template ID: `template_raxablt`
- Public Key: `Pjm_6UO0IBOtWts5p`

These are **required** for the contact form to work.

---

## ✅ You're Ready!

Your portfolio is configured correctly. Just:

1. Go to Vercel
2. Import your GitHub repo
3. Add the 3 environment variables
4. Deploy!

Your professional portfolio will be live in minutes! 🚀

---

**Questions?** Check the Vercel docs or reach out to their support - they're very responsive!
