# EmailJS Setup Guide for Contact Form

Your contact form is already configured to send emails to `sayedzaynshah@gmail.com`. Follow these steps to set up EmailJS so the form works properly.

## Step 1: Create an EmailJS Account

1. Go to [https://www.emailjs.com/](https://www.emailjs.com/)
2. Click "Sign Up" and create a free account
3. Verify your email address

## Step 2: Add Your Email Service

1. Once logged in, go to **Email Services** in the dashboard
2. Click **Add New Service**
3. Choose **Gmail** as your email service
4. Click **Connect Account** and authorize EmailJS to use your Gmail
5. Your Gmail (`sayedzaynshah@gmail.com`) will be automatically detected
6. Click **Create Service**
7. **SAVE YOUR SERVICE ID** - you'll need this later

## Step 3: Create an Email Template

1. Go to **Email Templates** in the dashboard
2. Click **Create New Template**
3. Use this template content:

**Template Settings:**
- **Template Name:** Portfolio Contact Form

**Email Content:**
```
Subject: {{subject}}

From: {{from_name}} ({{from_email}})

Message:
{{message}}

---
This message was sent via your portfolio contact form.
```

**To Email:** `sayedzaynshah@gmail.com`

4. Click **Save**
5. **SAVE YOUR TEMPLATE ID** - you'll need this later

## Step 4: Get Your Public Key

1. Go to **Account** → **General**
2. Find your **Public Key** (also called User ID)
3. **SAVE YOUR PUBLIC KEY** - you'll need this later

## Step 5: Configure Your Flutter App

You need to pass the EmailJS credentials when building your app. You have three credentials:
- SERVICE_ID (from Step 2)
- TEMPLATE_ID (from Step 3)
- PUBLIC_KEY (from Step 4)

### For Development/Testing:

Run your app with the credentials:

```bash
flutter run -d chrome --dart-define=EMAILJS_SERVICE_ID=your_service_id --dart-define=EMAILJS_TEMPLATE_ID=your_template_id --dart-define=EMAILJS_PUBLIC_KEY=your_public_key
```

### For Production Build:

Build your web app with the credentials:

```bash
flutter build web --release --dart-define=EMAILJS_SERVICE_ID=your_service_id --dart-define=EMAILJS_TEMPLATE_ID=your_template_id --dart-define=EMAILJS_PUBLIC_KEY=your_public_key
```

**Replace:**
- `your_service_id` with your actual Service ID
- `your_template_id` with your actual Template ID
- `your_public_key` with your actual Public Key

## Step 6: Test Your Contact Form

1. Run/build your app with the credentials (Step 5)
2. Navigate to the contact section at the bottom of your portfolio
3. Fill out the form:
   - Name: Test User
   - Email: test@example.com
   - Message: This is a test message
4. Click "Send Message"
5. Check your Gmail (`sayedzaynshah@gmail.com`) for the message

## How It Works

1. When someone fills out your contact form, the form data is sent to EmailJS
2. EmailJS uses your Gmail account to send the email
3. You receive the message in `sayedzaynshah@gmail.com`
4. If EmailJS fails (missing credentials or network error), the form automatically falls back to opening the user's email client with a pre-filled message

## Fallback Behavior

If EmailJS is not configured or fails:
- The app will open the user's default email client
- A pre-filled email will be created with:
  - To: `sayedzaynshah@gmail.com`
  - Subject: Portfolio Inquiry
  - Body: Contains the form data
- User can send it from their email client

## Important Notes

1. **Free Tier Limits:** EmailJS free plan allows 200 emails/month
2. **Security:** Your credentials are safe - they're compiled into the app and not exposed in source code
3. **Testing:** Always test the form after deployment to ensure emails are received
4. **Spam Folder:** Check your spam folder if you don't receive test emails

## Troubleshooting

**Problem:** Not receiving emails
- **Solution:** Check your EmailJS dashboard to see if emails are being sent
- Verify your Gmail (`sayedzaynshah@gmail.com`) is correctly set in the template
- Check your spam folder

**Problem:** Form shows error message
- **Solution:** Verify all three credentials are correct
- Make sure you're building with the `--dart-define` flags
- Check browser console for error messages

**Problem:** Mailto opens instead of sending via EmailJS
- **Solution:** This is the fallback behavior when EmailJS credentials are missing
- Add the credentials using the `--dart-define` flags when building

## Example Full Build Command

```bash
flutter build web --release --dart-define=EMAILJS_SERVICE_ID=service_abc123 --dart-define=EMAILJS_TEMPLATE_ID=template_xyz789 --dart-define=EMAILJS_PUBLIC_KEY=user_def456
```

---

**Current Configuration:**
- ✅ Recipient Email: `sayedzaynshah@gmail.com`
- ✅ Contact form already integrated
- ✅ Fallback to mailto if EmailJS fails
- ✅ Form validation included
- ⏳ Needs EmailJS credentials (follow steps above)
