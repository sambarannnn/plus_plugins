# Plus Plugins Documentation for Flutter Mono Repo

## Introduction
The PlusPlugins mono repo contains a collection of Flutter plugins developed by the Flutter Community, enhanced with additional functionalities and platform support beyond the original Flutter plugins. These plugins aim to offer reliable, cross-platform implementations for various system functionalities.

## Repository Structure
The repository includes multiple packages, each targeting specific functionalities like device connectivity, battery information, sharing content, accessing package information, and more. Each package is designed to work seamlessly across multiple platforms, including Android, iOS, Windows, macOS, Linux, and the web.

---

## Table of Contents

- [Getting Started](#getting-started)
- [Package Overview](#package-overview)
  - [Share Plus](#share-plus)
  - [Package Info Plus](#package-info-plus)
  - [Sensor Plus](#sensors-plus)
  - [Connectivity Plus](#connectivity-plus)
- [Contributing](#contributing)
- [Running Example Apps and Tests](#running-example-apps-and-tests)
- [Repository Maintenance and Contribution Workflow](#repository-maintenance-and-contribution-workflow)

---

## Getting Started

To start using these plugins, first, clone the repository using your preferred method (SSH or HTTPS). For example:

```bash
git clone https://github.com/fluttercommunity/plus_plugins.git
```

Each plugin can be added as a dependency in your Flutter project. You can include individual plugins like so:

```yaml
dependencies:
  flutter:
    sdk: flutter
  share_plus: any
  package_info_plus: any
```

Don't forget to run

```bash
flutter pub get
```

to install the new dependencies.
 

---

## Package Overview

### Share Plus
🔗 **Overview:**
Share Plus allows you to share content via the platform's share dialog, utilizing ACTION_SEND Intent on Android and UIActivityViewController on iOS. 

🚀 **Getting Started with Share Plus**:
1. Add Share Plus to your project by including it in your `pubspec.yaml`:
   ```yaml
   dependencies:
     share_plus: "^version_number"
   ```
2. Import Share Plus in your Dart code:
   ```dart
   import 'package:share_plus/share_plus.dart';
   ```
3. Use the `Share.share` method to share content:
   ```dart
   Share.share('Check out this URL https://example.com');
   ```

---

### Package Info Plus
🔗 **Overview:**
This plugin provides an API to query information about the application package like the app name, package name, version, and build number. 

🚀 **Getting Started with Package Info Plus**:
1. Add it to your Flutter project:
   ```yaml
   dependencies:
     package_info_plus: "^version_number"
   ```
2. Import it in your Dart file:
   ```dart
   import 'package:package_info_plus/package_info_plus.dart';
   ```
3. Querying package information:
   ```dart
   PackageInfo packageInfo = await PackageInfo.fromPlatform();
   print("The app name is: ${packageInfo.appName}");
   ```

---

### Sensors Plus
🔗 **Overview:**
Sensors Plus provides access to motion sensors like accelerometers and gyroscope events. 

🚀 **Getting Started with Sensors Plus**:
1. Include Sensors Plus in your `pubspec.yaml`:
   ```yaml
   dependencies:
     sensors_plus: "^version_number"
   ```
2. Capture sensor data using:
   ```dart
   accelerometerEvents.listen((AccelerometerEvent event) {
     print(event);
   });
   ```

---

### Connectivity Plus
🔗 **Overview:**
Connectivity Plus offers a cross-platform API to check the device's connectivity state, e.g., Wi-Fi, mobile data. 

🚀 **Getting Started with Connectivity Plus**:
1. Add Connectivity Plus to your project dependencies:
   ```yaml
   dependencies:
     connectivity_plus: "^version_number"
   ```
2. Use Connectivity Plus to check connectivity:
   ```dart
   var result = await Connectivity().checkConnectivity();
   if (result == ConnectivityResult.mobile) {
     print('Connected to a mobile network.');
   }
   ```

---

## Contributing
PlusPlugins welcomes contributions that improve the plugins and cover more platform-specific functionalities. For guidance on setup, running, and contributing to the projects, see the `CONTRIBUTING.md` file included in the root directory of the repository. 

---

## Running Example Apps and Tests
Each plugin package contains an example app demonstrating its functionalities. To run the example app or the integrated tests, use commands provided in the `melos.yaml` file located at the root of the repository. 

### Example:
```bash
melos run build:example_ios
```

This will compile and run the iOS example app. Similarly, replace `ios` with `android`, `web`, etc., to run examples for other platforms.

---

## Repository Maintenance and Contribution Workflow
The repository utilizes Melos to manage multi-package repositories and streamline the workflow. Standard procedures for building, formatting code, and running tests are defined in `melos.yaml`. The workflow typically includes code analysis, formatting checks, and running example apps and tests for different platforms. 

When contributing, it is advised to create a branch per package if working on multiple packages to ease the review and maintenance process. Ensure all pull requests follow the guidelines specified in the repository documentation, enabling maintainers to efficiently review and merge contributions. 

--- 

This comprehensive documentation provides you with all the necessary information to utilize the PlusPlugins, contribute to its ecosystem, enhance your Flutter applications with robust functionality, and maintain consistency with best practices in Flutter development.
