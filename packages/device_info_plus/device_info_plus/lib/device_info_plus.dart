// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:flutter/foundation.dart';

import 'src/model/android_device_info.dart';
import 'src/model/ios_device_info.dart';
import 'src/model/linux_device_info.dart';
import 'src/model/macos_device_info.dart';
import 'src/model/web_browser_info.dart';
import 'src/model/windows_device_info.dart';

export 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart'
    show BaseDeviceInfo;

export 'src/model/android_device_info.dart';
export 'src/model/ios_device_info.dart';
export 'src/model/linux_device_info.dart';
export 'src/model/macos_device_info.dart';
export 'src/model/web_browser_info.dart';
export 'src/model/windows_device_info.dart';

export 'src/device_info_plus_linux.dart'
    if (dart.library.js_interop) 'src/device_info_plus_web.dart';
export 'src/device_info_plus_windows.dart'
    if (dart.library.js_interop) 'src/device_info_plus_web.dart';

class DeviceInfoPlugin {
  DeviceInfoPlugin();

  static DeviceInfoPlatform get _platform {
    return DeviceInfoPlatform.instance;
  }

  AndroidDeviceInfo? _cachedAndroidDeviceInfo;
  Future<AndroidDeviceInfo> get androidInfo async =>
      _cachedAndroidDeviceInfo ??=
          AndroidDeviceInfo.fromMap((await _platform.deviceInfo()).data);

  IosDeviceInfo? _cachedIosDeviceInfo;
  Future<IosDeviceInfo> get iosInfo async => _cachedIosDeviceInfo ??=
      IosDeviceInfo.fromMap((await _platform.deviceInfo()).data);

  LinuxDeviceInfo? _cachedLinuxDeviceInfo;
  Future<LinuxDeviceInfo> get linuxInfo async => _cachedLinuxDeviceInfo ??=
      await _platform.deviceInfo() as LinuxDeviceInfo;

  WebBrowserInfo? _cachedWebBrowserInfo;
  Future<WebBrowserInfo> get webBrowserInfo async =>
      _cachedWebBrowserInfo ??= await _platform.deviceInfo() as WebBrowserInfo;

  MacOsDeviceInfo? _cachedMacosDeviceInfo;

  Future<MacOsDeviceInfo> get macOsInfo async => _cachedMacosDeviceInfo ??=
      MacOsDeviceInfo.fromMap((await _platform.deviceInfo()).data);

  WindowsDeviceInfo? _cachedWindowsDeviceInfo;

  Future<WindowsDeviceInfo> get windowsInfo async =>
      _cachedWindowsDeviceInfo ??=
          await _platform.deviceInfo() as WindowsDeviceInfo;

  Future<BaseDeviceInfo> get deviceInfo async {
    if (kIsWeb) {
      return webBrowserInfo;
    } else {
      if (Platform.isAndroid) {
        return androidInfo;
      } else if (Platform.isIOS) {
        return iosInfo;
      } else if (Platform.isLinux) {
        return linuxInfo;
      } else if (Platform.isMacOS) {
        return macOsInfo;
      } else if (Platform.isWindows) {
        return windowsInfo;
      }
    }
    // allow for extension of the plugin
    return _platform.deviceInfo();
  }
}
