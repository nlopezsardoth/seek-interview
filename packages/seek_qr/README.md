# 📌 SeekQR Plugin

A Flutter plugin for **scanning QR codes** using native implementations on **Android** (Google ML Kit) and **iOS** (VisionKit).

---

## 🚀 Installation

### 1️⃣ Add Dependency

In your Flutter project's `pubspec.yaml`, add:

```yaml
dependencies:
  seek_qr:
    path: ../seek_qr  # Or replace with your package source (pub.dev, GitHub, etc.)
```

Run:

```sh
flutter pub get
```

---

## ⚙️ Native Setup

### 📌 Android

#### 1️⃣ Modify `AndroidManifest.xml`

Add **camera permissions** inside `<manifest>`:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
```

Ensure the **activity** can handle camera access:

```xml
<application ...>
  ...
  <meta-data
      android:name="com.google.mlkit.vision.DEPENDENCIES"
      android:value="barcode_ui"/>
  ...
</application>

```

### 📌 iOS

#### 1️⃣ Add Camera Permissions

Edit `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>We need access to your camera for scanning QR codes.</string>
```

#### 2️⃣ Ensure iOS 16+ Support

In `ios/Podfile`, set:

```ruby
platform :ios, '16.0'
```

Run:

```sh
cd ios && pod install
```

---

## 📜 Usage

### 1️⃣ Import the Plugin

```dart
import 'package:seek_qr/seek_qr.dart';
```

### 2️⃣ Scan a QR Code

```dart
final scanner = SeekQR();
final result = await scanner.scanQRCode();

if (result.code != null) {
  print("Scanned QR Code: ${result.code}");
} else {
  print("Error: ${result.errorMessage}");
}
```

---

## ❓ Troubleshooting

### Android Issues

- If **QRScannerActivity not found**, ensure it's **declared in AndroidManifest.xml**.
- If **crashes on startup**, try:

  ```sh
  flutter clean
  flutter pub get
  ```

### iOS Issues

- If **scanning not starting**, ensure:
  - Running on **iOS 16+** (VisionKit is **not available on lower versions**).
  - **Permissions** are added in `Info.plist`.

---

## 📌 License

MIT License.
