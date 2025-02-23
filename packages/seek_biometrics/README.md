# Seek Biometrics Plugin

## Overview
Seek Biometrics is a Flutter plugin that provides biometric authentication support using the native biometric APIs on Android and iOS.

## Installation
To use this plugin, add it to your `pubspec.yaml` file:
```yaml
seek_biometrics:
    path: ../seek_biometrics
```
Then, run:
```sh
flutter pub get
```

## Platform-Specific Setup
### Android Configuration
1. **Update `AndroidManifest.xml`**
   Add the following permissions inside `<manifest>`:
   ```xml
   <uses-permission android:name="android.permission.USE_BIOMETRIC" />
   <uses-permission android:name="android.permission.USE_FINGERPRINT" />
   ```
   Inside the `<application>` tag, add:
   ```xml
   <meta-data android:name="androidx.biometric.BiometricManager" android:value="true" />
   ```

2. **Update `MainActivity.kt`**
   Modify your `MainActivity.kt` to extend `FlutterFragmentActivity`:
   ```kotlin
   package com.example.yourapp

   import io.flutter.embedding.android.FlutterFragmentActivity

   class MainActivity: FlutterFragmentActivity() {
       // No additional code needed
   }
   ```

3. **Ensure Emulator Supports Biometrics**
   - Open Android Emulator settings
   - Navigate to `Extended Controls > Fingerprint`
   - Add fingerprints
   - Use `adb` to simulate authentication:
     ```sh
     adb -e emu finger touch 1
     ```

### iOS Configuration
1. **Enable Biometric Permissions**
   Add the following to `ios/Runner/Info.plist`:
   ```xml
   <key>NSFaceIDUsageDescription</key>
   <string>We use Face ID to authenticate users</string>
   ```

2. **Ensure iOS Deployment Target is 12.0+**
   Update `ios/Podfile`:
   ```ruby
   platform :ios, '12.0'
   ```
   Then, run:
   ```sh
   cd ios
   pod install
   ```

## Usage
Import the plugin in your Flutter app:
```dart
import 'package:seek_biometrics/seek_biometrics.dart';
```

### Checking if Biometrics is Available
```dart
bool isSupported = await SeekBiometrics.instance.isDeviceSupported();
print("Biometrics Supported: $isSupported");
```

### Authenticating User
```dart
final result = await SeekBiometrics.instance.authenticate(
    title: "Login with Biometrics",
    subtitle: "Scan your fingerprint or face",
);
if (result.success) {
    print("Authentication Successful");
} else {
    print("Authentication Failed: ${result.errorMessage}");
}
```

## Integration Testing
To test biometric authentication in the emulator, use:
```sh
adb -e emu finger touch 1
```
This simulates a successful fingerprint scan.

## Troubleshooting
- If `BiometricManager is NULL!`, ensure `onAttachedToActivity()` is being called correctly.
- If authentication fails, check that biometrics are enabled on the device.

## License
MIT License

