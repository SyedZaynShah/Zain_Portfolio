# Polymorphism — Portfolio of Raihan Fadli

> **Precision in Motion.** A Flutter Web portfolio built on the "Deep Space Elegance" design language — generative backgrounds, kinetic typography, and a custom motion system, all rendered at 60 fps.

**Live:** [www.raihandev.space](https://www.raihandev.space)

Raihan Fadli is a visual engineer based in Jakarta, Indonesia, balancing engineering, art, and design. This repository is both his live portfolio and a reference implementation of a heavily animated, token-driven Flutter web app.

---

## Tech Stack

| Layer | Technology |# NOVA ✦ Engineering Portfolio of Syed Zain ul Abdeen Shah

> **Crafting production-grade software with precision, performance, and purpose.**
>
> A next-generation Flutter Web portfolio showcasing modern mobile and web engineering through cinematic animations, interactive storytelling, and real-world software architecture.

<div align="center">

### 🚀 Live Portfolio

*(Coming Soon)*

### 👨‍💻 Full Stack Mobile & Web Developer

Flutter • Next.js • Firebase • PostgreSQL • Prisma • React

📍 Abbottabad, Pakistan

</div>

---

# About

Hi, I'm **Syed Zain ul Abdeen Shah**.

A Full Stack Mobile & Web Developer passionate about building software that solves real problems.

Unlike tutorial-based portfolios, every featured project here has been designed, engineered, and shipped with production-quality architecture.

My work focuses on:

- 📱 Cross-platform mobile development
- 🌐 Modern web engineering
- ⚡ Real-time applications
- 🔒 Secure authentication systems
- ☁ Cloud-native backend integration
- 🎨 Pixel-perfect user experiences
- 🧠 Scalable software architecture

Whether it's a secure messaging platform, an enterprise dashboard, or an AI-powered application, I believe software should feel effortless to use while remaining robust under the hood.

---

# Tech Stack

| Category | Technologies |
|------------|-------------|
| Mobile Development | Flutter • Dart • Riverpod • Firebase • Supabase |
| Frontend | HTML5 • CSS3 • JavaScript • React.js • Next.js |
| Backend | Firebase • Firestore • Prisma • PostgreSQL • REST APIs |
| Authentication | Firebase Auth • NextAuth |
| Storage | Cloudinary • Supabase Storage |
| State Management | Riverpod • Provider |
| Languages | Dart • JavaScript • Python • Java • C++ |
| Tools | Git • GitHub • VS Code • Android Studio • Postman |
| Deployment | Vercel • Firebase Hosting |

---

# Featured Projects

## 📱 ModChat

Production-ready secure messaging platform.

### Built With

Flutter

Firebase Authentication

Cloud Firestore

Supabase

Riverpod

WebRTC

### Features

- Secure Authentication
- One-to-One Messaging
- Group Chats
- Voice Calling
- Video Calling
- AI Content Filtering
- Message Moderation
- Media Sharing
- Scalable Firestore Architecture
- Cross-platform Support

---

## 🏡 Enterprise Property Management Platform

Production web platform developed using:

Next.js

Prisma

PostgreSQL

NextAuth

Cloudinary

### Features

- Role-Based Authentication
- Property CRUD
- Admin Dashboard
- Server-Side Rendering
- Advanced Search & Filtering
- Image Management
- Responsive UI

Live Website

https://homeprop.uk

---

## 🎬 Netflix Clone

React.js

Pixel-perfect recreation of the Netflix experience focusing on reusable components, responsive layouts, and modern frontend engineering.

---

## 🧪 Laboratory Management System

Flutter

Laboratory inventory and management application built with clean architecture and responsive design.

---

## 🚗 Showroom Management System

Java

Desktop application featuring customer management, inventory management, billing, and sales tracking.

---

## 🤖 Interactive AI Chatbot

Python

Natural language chatbot capable of conversational responses using modern NLP techniques and Gen-Z conversational personality.

---

# Professional Experience

## Full Stack Mobile & Web Developer

### Techno Spire Global

**August 2025 — January 2026**

Worked on production-ready web and mobile applications using Flutter, React, Next.js, Firebase, PostgreSQL, Prisma, and modern cloud technologies.

Responsibilities included:

- Developing Flutter applications
- Building Next.js web platforms
- Database design
- Authentication systems
- API integrations
- Performance optimization
- Production deployments
- Client collaboration

---

# Architecture

```
lib/

├── core/
│     Theme
│     Routing
│     Constants
│     Utilities
│
├── data/
│     Portfolio Models
│     Project Data
│
├── shared/
│     Animations
│     Components
│     Glass Widgets
│     Motion System
│
├── features/
│     Hero
│     About
│     Skills
│     Experience
│     Projects
│     Contact
│
└── main.dart
```

---

# Engineering Philosophy

> Build software that users never have to think about.

I believe great software isn't defined by the number of technologies used, but by how naturally everything works together.

Every project in this portfolio follows:

- Clean Architecture
- Reusable Components
- Maintainable Code
- Performance First
- Responsive Design
- Modern UI Principles
- Scalable Data Models
- Production Readiness

---

# Development Environment

| Tool | Version |
|--------|----------|
| Flutter | 3.41+ |
| Dart | 3.11+ |
| Chrome | Latest |
| VS Code | Latest |

---

# Running Locally

```bash
git clone https://github.com/SyedZaynShah/portfolio.git

cd portfolio

flutter pub get

flutter run -d chrome
```

---

# Build

```bash
flutter build web --release
```

---

# Deployment

Hosted using

- Firebase Hosting
- Vercel

---

# Contact

### 👨‍💻 Syed Zain ul Abdeen Shah

📧 sayedzaynshah@gmail.com

📱 +92 342 7181095

📍 Abbottabad, Pakistan

GitHub

https://github.com/SyedZaynShah

---

# Current Focus

🚀 Building scalable Flutter applications

⚡ Modern Next.js platforms

☁ Cloud-native architectures

📱 Cross-platform mobile experiences

🤖 AI-powered software solutions

---

<div align="center">

## "I don't just build apps.

I engineer digital products that people rely on."

---

Made with ❤️ using Flutter

Designed & Developed by

### Syed Zain ul Abdeen Shah

</div>
|---|---|
| Framework | Flutter 3.41+ (web, CanvasKit renderer) |
| Language | Dart 3.11+ |
| Routing | [go_router](https://pub.dev/packages/go_router) — `/` and deep-linkable `/work/:id` |
| Typography | [google_fonts](https://pub.dev/packages/google_fonts) — Space Grotesk, Inter, JetBrains Mono |
| Smooth scrolling | [flutter_web_scroll](https://pub.dev/packages/flutter_web_scroll) (Lenis-style) |
| Icons | [lucide_icons_flutter](https://pub.dev/packages/lucide_icons_flutter) |
| Motion extras | [confetti](https://pub.dev/packages/confetti), custom painters & implicit animations |
| Visibility-driven reveals | [visibility_detector](https://pub.dev/packages/visibility_detector) |
| Contact form | [EmailJS](https://www.emailjs.com/) over [http](https://pub.dev/packages/http), keys injected via `--dart-define` |
| CI/CD | Vercel Git integration (`vercel_build.sh`) on push to `main` |

### Architecture at a Glance

```
lib/
├── core/        # design tokens (app_tokens, app_typography, app_theme),
│                # constants, router, responsive utils, email service
├── data/        # models + portfolio_data.dart — single source of ALL content
├── shared/      # painters (particles/grid/glow), glass cards, custom cursor,
│                # magnetic buttons, scroll-reveal animations
└── features/    # intro, hero, about, works, experience, statement, contact,
                 # shell (portfolio_shell + floating_nav)
```

---

## Quick Start

```bash
git clone https://github.com/lraihan/polymorphism.git
cd polymorphism
flutter pub get
flutter run -d chrome
```

The app runs fully without configuration — the contact form simply falls back to a `mailto:` link until EmailJS keys are provided (see [Configuration](#configuration)).

## Environment Requirements

| Requirement | Version |
|---|---|
| Flutter SDK | **3.41 or newer** (stable channel) |
| Dart SDK | **3.11 or newer** (ships with Flutter) |
| Browser | Any modern browser; Chrome recommended for development |

Verify with `flutter doctor` and `flutter --version`.

## Building for Web

```bash
# Debug / local
flutter run -d chrome

# Release build (output in build/web/)
flutter build web --release
```

> **Note:** the `--web-renderer` flag **no longer exists** in Flutter 3.41+. CanvasKit is the default renderer — do not copy older tutorials that pass `--web-renderer canvaskit`.

The `android/`, `ios/`, `linux/`, `macos/`, and `windows/` directories are untouched platform scaffolds. **Web is the only supported and deployed target.**

## Configuration

All personal content lives in exactly two places — edit these to make the portfolio yours:

| File | What it holds |
|---|---|
| `lib/data/portfolio_data.dart` | Projects (titles, descriptions, screenshots, tech stacks), career timeline, skills, social links |
| `lib/core/constants/strings.dart` | Site title, hero copy, section headings, bio, contact copy |

Project galleries live in `assets/works/_gallery/<project>/` (referenced from `lib/core/constants/assets.dart`) and are registered in `pubspec.yaml`.

Design tokens (colors, durations, curves, spacing) live in `lib/core/theme/app_tokens.dart`; typography in `lib/core/theme/app_typography.dart`.

### EmailJS (contact form)

The contact form sends real email through EmailJS. Credentials are injected at build time via `--dart-define` and are never committed:

```bash
cp .env.example .env.local   # then fill in your credentials
```

| Variable | Source |
|---|---|
| `EMAILJS_SERVICE_ID` | EmailJS dashboard → Services |
| `EMAILJS_TEMPLATE_ID` | EmailJS dashboard → Email Templates |
| `EMAILJS_PUBLIC_KEY` | EmailJS dashboard → Account → API Keys |

Run with the keys:

```bash
flutter run -d chrome \
  --dart-define=EMAILJS_SERVICE_ID="..." \
  --dart-define=EMAILJS_TEMPLATE_ID="..." \
  --dart-define=EMAILJS_PUBLIC_KEY="..."
```

Without keys, the form gracefully degrades to a `mailto:` fallback. Full walkthrough: [ENVIRONMENT_SETUP.md](ENVIRONMENT_SETUP.md).

## Deployment

Hosted on Vercel at [www.raihandev.space](https://www.raihandev.space).

### Vercel Git integration (primary)

Every push to `main` triggers Vercel's build, which runs `vercel_build.sh` — it fetches the pinned Flutter SDK and runs `flutter build web --release --no-tree-shake-icons`, injecting the EmailJS keys as `--dart-define`s. Config lives in `vercel.json` (`buildCommand`, `outputDirectory: build/web`, SPA rewrites). The EmailJS values are set as Vercel **Project → Environment Variables**:

- `EMAILJS_SERVICE_ID`, `EMAILJS_TEMPLATE_ID`, `EMAILJS_PUBLIC_KEY`

> `vercel_build.sh` must stay LF (enforced by `.gitattributes`) — a CRLF would make bash choke when the Vercel CLI uploads it from Windows.

### Manual deploy via the Vercel CLI

```bash
npm i -g vercel
vercel link        # link to the existing "polymorphism" project
vercel --prod      # build on Vercel's infra and alias to production
```

### Manual production build

```bash
./build_prod.sh
```

The script loads `.env.production` (or system/CI environment variables), validates that all three EmailJS variables are set, and produces a release build in `build/web/`.

### Alternative hosts

- **Firebase Hosting** — `flutter build web --release`, then `firebase init hosting` (public dir: `build/web`) and `firebase deploy`.
- **GitHub Pages** — `flutter build web --release --base-href "/<repo-name>/"`, then publish `build/web` to the `gh-pages` branch.

## Contributing

This is a personal portfolio, but fixes and improvements are welcome:

1. Fork and create a feature branch from `main`.
2. Keep `flutter analyze` clean — the project enforces ~150 strict lint rules (package imports only, `require_trailing_commas`, `prefer_expression_function_bodies`, `prefer_const_constructors`, …). No warnings, no exceptions.
3. Respect the design system: use tokens from `app_tokens.dart` (`AppDurations`, `AppCurves`, color constants) rather than hardcoding values.
4. Keep content in `lib/data/portfolio_data.dart` / `lib/core/constants/strings.dart` — never inline copy inside widgets.
5. Open a pull request with a clear description of the change.

## Documentation

- [`docs/`](docs/) — design language, architecture notes, and development guides
- [`AUDIT_REPORT.md`](AUDIT_REPORT.md) — the pre-redesign audit (architecture, technical debt, keep/refactor/rebuild decisions)
- [`CHANGELOG.md`](CHANGELOG.md) — release history
- [`ENVIRONMENT_SETUP.md`](ENVIRONMENT_SETUP.md) — EmailJS environment variable setup

## Contact

- Email: [lraihan@hackermail.com](mailto:lraihan@hackermail.com)
- GitHub: [@lraihan](https://github.com/lraihan)
- LinkedIn: [Raihan Fadli](https://www.linkedin.com/in/raihan-fadli-dev/)
- Instagram: [@locio_raihan](https://www.instagram.com/locio_raihan/)

---

Built with Flutter Web ✦ Jakarta, Indonesia
