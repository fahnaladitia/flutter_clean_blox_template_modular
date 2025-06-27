# 🚀 Flutter CleanBLoX Template (Modular)

A production-ready Flutter template featuring **BLoC**, **Clean Architecture**,  and **Modular** design patterns. This template is designed to help you kickstart your Flutter projects with a solid foundation, ensuring maintainability and scalability.

Created with ❤️ by [**Pahnal Aditia**](https://www.linkedin.com/in/pahnaladitia)

---

## 📖 Table of Contents

- [🚀 Flutter CleanBLoX Template (Modular)](#-flutter-cleanblox-template-modular)
  - [📖 Table of Contents](#-table-of-contents)
  - [✨ Features](#-features)
  - [🗂 Project Structure](#-project-structure)
  - [🚀 Getting Started](#-getting-started)
    - [🔧 Setup Instructions](#-setup-instructions)
      - [1. Project \& Package Name](#1-project--package-name)
      - [2. App Links \& Universal Links](#2-app-links--universal-links)
    - [▶️ Run the App](#️-run-the-app)
    - [For Android APK build](#for-android-apk-build)
    - [For iOS build (Note: requires macOS)](#for-ios-build-note-requires-macos)
  - [📝 Notes](#-notes)

---
## ✨ Features

✅ **Modular architecture** — Setiap feature sebagai package: *isolated*, *scalable*, *maintainable*  
✅ **Clean Architecture principles** — Struktur `domain`, `data`, `presentation` di setiap fitur  
✅ **BLoC Pattern** — Powered by [flutter_bloc](https://pub.dev/packages/flutter_bloc)  
✅ **Melos support** — Monorepo management dengan [melos](https://pub.dev/packages/melos)  
✅ **Flavoring** — Staging & production ready  
✅ **CI/CD** — GitHub Actions untuk build APK signed otomatis  
✅ **Shared resources** — `shared/` untuk widgets, theme, utils yang dipakai global  
✅ **Core domain** — `core/` untuk pure logic, interfaces, base classes  

---
## 🗂 Project Structure

```bash
repo/
├── application/           # Main app runner
├── core/                  # Base logic, interfaces, core services
├── shared/                # Global widgets, themes, utils
├── features/
│   ├── auth/              # Auth feature module
│   └── home/              # Home feature module
├── .melos.yaml            # Melos config for monorepo
├── pubspec.yaml           # Root pubspec
└── melos.yaml             # Melos scripts & workspace
```
---

## 🚀 Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/fahnaladitia/flutter_clean_blox_template_modular.git

# 2.  Install dependencies
melos bootstrap
```

### 🔧 Setup Instructions

#### 1. Project & Package Name

See [SETUP.md](SETUP.md) for how to manually configure your project’s package name and build flavors.

#### 2. App Links & Universal Links

To enable Android and iOS deep linking, follow [APPLINKS.md](APPLINKS.md).

---

### ▶️ Run the App

```bash
# For staging
melos run:debug:staging
melos run:release:staging

# For production
melos run:debug:production
melos run:release:production
```

### For Android APK build

```bash
# For staging
melos run build:staging:apk
# For production
melos run build:production:apk
```


### For iOS build (Note: requires macOS)
Not Tested, but you can use the following commands to build for iOS:
```bash
# For staging
melos run build:staging:ios

flutter build ipa --obfuscate --split-debug-info=out/android --flavor staging -t lib/main_staging.dart
# For production
flutter build ios --flavor production -t lib/main_production.dart

flutter build ipa --obfuscate --split-debug-info=out/android --flavor production -t lib/main_production.dart
```

---

## 📝 Notes

* This template uses **GetIt** for dependency injection, **Dio** for networking, and **Sentry** for error tracking.
* The app is structured using **BLoC** for state management, following the **Clean Architecture** principles.
* **Melos** is used for monorepo management, allowing you to easily manage multiple packages and features.
* The template includes **flavoring** for staging and production builds, making it easy to switch between environments.
* **Flutter Launcher Icons** and **Flutter Native Splash** are configured for custom app icons and splash screens.
* **Chucker Flutter** and **Cote Network Logger** are included for debugging network requests.
* **Intl** package is used for internationalization, allowing you to easily add multiple languages.
* The app uses **go_router** for navigation, providing a simple and powerful routing solution.
* The project is set up with **GitHub Actions** for CI/CD, automating the build and deployment process.
* Customize error handling in `error_interceptor.dart`.
* Follow official docs for more detailed configuration:

  * [Sentry Flutter](https://docs.sentry.io/platforms/flutter/)
  * [Dio](https://pub.dev/packages/dio#interceptors)
  * [GetIt](https://pub.dev/packages/get_it)
  * [BLoC](https://pub.dev/packages/flutter_bloc)
  * [Intl](https://pub.dev/packages/intl)
  * [go\_router](https://pub.dev/packages/go_router)
  * [Chucker Flutter](https://pub.dev/packages/chucker_flutter)
  * [Cote Network Logger](https://pub.dev/packages/cote_network_logger)
  * [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
  * [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)
  * [Flutter Flavoring](https://docs.flutter.dev/deployment/flavors)
  * [Flutter App & Universal Links](https://docs.flutter.dev/cookbook/navigation/set-up-app-links)
  *  [Melos](https://melos.invertase.dev/)

---

