# 🚀 Flutter CleanBLoX Template (Modular)

A **production-ready Flutter starter kit** built with **Clean Architecture**, **BLoC Pattern**, and **Modular Monorepo Structure** — built for scalability, maintainability, and rapid development.

Created with ❤️ by [**Pahnal Aditia**](https://www.linkedin.com/in/pahnaladitia)

---

## 📚 Table of Contents

- [🚀 Flutter CleanBLoX Template (Modular)](#-flutter-cleanblox-template-modular)
  - [📚 Table of Contents](#-table-of-contents)
  - [✨ Features](#-features)
  - [📁 Project Structure](#-project-structure)
  - [⚙️ Getting Started](#️-getting-started)
    - [🛠 Initial Setup](#-initial-setup)
      - [Project Setup Details](#project-setup-details)
    - [▶️ Running the App](#️-running-the-app)
    - [📦 Building APK \& IPA](#-building-apk--ipa)
      - [📱 Android APK](#-android-apk)
      - [🍏 iOS IPA](#-ios-ipa)
  - [📝 Developer Notes](#-developer-notes)
  - [🚀 Ready to Launch?](#-ready-to-launch)

---

## ✨ Features

✅ **Modular Architecture** — Each feature lives in its own independent package  
✅ **Clean Architecture** — Clear separation of `data`, `domain`, and `presentation` layers  
✅ **BLoC State Management** — Built using [flutter_bloc](https://pub.dev/packages/flutter_bloc)  
✅ **Monorepo Ready** — Powered by [melos](https://pub.dev/packages/melos) for managing multi-packages  
✅ **Flavor Support** — Easily switch between `staging` and `production` builds  
✅ **CI/CD Integrated** — GitHub Actions ready for automated signed builds  
✅ **Shared Modules** — Centralized widgets, themes, and utilities in `shared/`  
✅ **Core Domain** — `core/` module for reusable interfaces, logic, and services

---

## 📁 Project Structure

```bash
repo/
├── application/           # App entry point and router
├── core/                  # Core logic & contracts (e.g., services, interfaces)
├── shared/                # Global widgets, styles, extensions, utilities
├── features/
│   ├── auth/              # Authentication feature module
│   └── home/              # Home feature module
├── pubspec.yaml           # Root pubspec
├── melos.yaml             # Melos scripts & workspace
└── .melos.yaml            # Melos config
```

---

## ⚙️ Getting Started

### 🛠 Initial Setup

```bash
# Clone the repo
git clone https://github.com/fahnaladitia/flutter_clean_blox_template_modular.git

# Install dependencies for all packages
melos bootstrap
```

#### Project Setup Details

- Package Name & Flavor Setup:
See [SETUP.md](docs/SETUP.md) for customizing your app’s name and flavors.

- App Links & Deep Linking:
See [APPLINKS.md](docs/APPLINKS.md) for universal link configuration for Android & iOS.

- CI/CD Configuration and Automated Builds:
See [ANDROID_CI.md](docs/ANDROID_CI.md) for setting up GitHub Actions for automated builds.

### ▶️ Running the App

```bash
# Staging environment
melos run:debug:staging
melos run:release:staging

# Production environment
melos run:debug:production
melos run:release:production
```

### 📦 Building APK & IPA

#### 📱 Android APK

```bash
# Build staging APK
melos run build:staging:apk

# Build production APK
melos run build:production:apk
```

#### 🍏 iOS IPA

```bash
# Staging build
melos run build:staging:ios
flutter build ipa --obfuscate --split-debug-info=out/android --flavor staging -t lib/main_staging.dart

# Production build
flutter build ios --flavor production -t lib/main_production.dart
flutter build ipa --obfuscate --split-debug-info=out/android --flavor production -t lib/main_production.dart
```

---

---

## 📝 Developer Notes

- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)  
- **Networking**: [Dio](https://pub.dev/packages/dio)  
- **Error Logging**: [Sentry](https://docs.sentry.io/platforms/flutter/)  
- **Localization**: [intl](https://pub.dev/packages/intl)  
- **Routing**: [go_router](https://pub.dev/packages/go_router)  
- **Testing & Logging**: [Chucker Flutter](https://pub.dev/packages/chucker_flutter), [Cote Network Logger](https://pub.dev/packages/cote_network_logger)  
- **UI Tooling**: [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons), [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)  
- **Flavor Management**: [Flutter Flavors](https://docs.flutter.dev/deployment/flavors)  
- **CI/CD**: GitHub Actions integrated  
- **App Link Setup**: [App & Universal Links](https://docs.flutter.dev/cookbook/navigation/set-up-app-links)

---

## 🚀 Ready to Launch?

Fork this template, plug in your logic, and ship your next big thing! 🎯
