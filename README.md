# seek-interview
# QR Scanner App

This is a modular Flutter application that follows Clean Architecture principles. It supports QR scanning, maintains a scan history, and integrates biometric authentication for security. The app is structured using Melos for package management and uses Bloc for state management.

## 📂 Project Structure

This app is built using a modular architecture with Melos, separating concerns into different modules:

```
seek-interview/
│── modules/
│   ├── auth_module/       # Handles authentication (PIN & biometric login)
│   ├── home_module/       # Main app module, includes QR scanning UI
│   ├── qr_scanner_module/ # QR scanning feature (camera integration)
│   ├── shared_module/     # Reusable utilities, components, and themes
│   ├── router_module/     # Navigation and route management
│── packages/
│   ├── seek_biometrics/   # Biometric authentication (Face ID / Fingerprint)
│   ├── seek_qr/           # QR scanning plugin (seek_qr)
│   ├── seek_secure_store/ # Secure storage utilities
│── seek_app/              # Main application entry point
│── fastlane/              # Fastlane setup for Firebase deployment
│── melos.yaml             # Melos workspace configuration
│── pubspec.yaml           # Flutter dependencies
│── README.md              # This file
```

---

## 🛠️ Clean Architecture Overview

The project follows Clean Architecture, separating logic into three main layers:

### 1️⃣ Data Layer (Handles external communication)
   - Repositories (implementation of domain logic)
   - Data Sources (local database, API, etc.)
   - Models (converting API responses to app objects)

### 2️⃣ Domain Layer (Business logic)
   - Use Cases (single-responsibility business rules)
   - Entities (core objects used across the app)

### 3️⃣ Presentation Layer (UI & State Management)
   - Blocs/Cubits (state management with Bloc)
   - Widgets (UI components)
   - Screens (full-page views)

---

### 📌 Example: QR Scanning Feature

**Data Layer:**
   - `QrScannerRepositoryImpl` (uses `seek_qr` plugin for scanning)
   - `QrHistoryRepositoryImpl` (stores scan history)

**Domain Layer:**
   - `ScanQrUseCase`
   - `GetQrHistoryUseCase`
   - `SaveQrHistoryUseCase`
   - `ClearQrHistoryUseCase`

**Presentation Layer:**
   - `QrBloc` (manages scanning & history state)
   - `QrScreen` (UI for scanning & history display)

---

## 🚀 Features

✅ **QR Code Scanning** – Uses `seek_qr` for fast QR detection.  
✅ **Scan History** – Stores scanned QR codes for later reference.  
✅ **Biometric Authentication** – Secure login using Face ID or Fingerprint.  
✅ **Bloc State Management** – Handles app state with `flutter_bloc`.  
✅ **Fastlane Deployment** – Automated builds and deployment to Firebase.  

---

## 📦 Installation & Setup

### 🔹 Prerequisites
- Install Flutter (>=3.x)
- Install **Melos**:
  ```sh
  dart pub global activate melos
  ```
- Install **Firebase CLI**:
  ```sh
  curl -sL https://firebase.tools | bash
  ```

### 🔹 Setup

Clone the repository:
```sh
git clone https://github.com/your-repo/qr_scanner_app.git
cd qr_scanner_app
```

Install dependencies:
```sh
melos bootstrap
```

Set up Firebase (if not already done):
```sh
firebase login
firebase init
```

Run the app:
```sh
flutter run
```

---

## 🧪 Testing

Unit tests and widget tests are implemented using **Mockito** and **BlocTest**.

Run all tests:
```sh
flutter test
```

Run tests for a specific module:
```sh
cd modules/qr_scanner
flutter test
```

---

## 📲 Deployment (Firebase App Distribution)

### 🔹 Fastlane Setup

Fastlane automates the deployment process for **Android & iOS**.

1. Install Fastlane:
   ```sh
   brew install fastlane
   ```
2. Navigate to the `android` or `ios` directory and initialize Fastlane:
   ```sh
   cd android
   fastlane init
   ```
3. Configure Firebase App Distribution in `fastlane/Fastfile`.

### 🔹 Deploy Android Build to Firebase
```sh
cd android
fastlane android beta
```

### 🔹 Deploy iOS Build to Firebase
```sh
cd ios
fastlane ios beta
```

⚠️ **Note:**  
For **iOS deployment**, you must be enrolled in the **Apple Developer Program** to distribute via TestFlight. Otherwise, you can manually upload the `.ipa` to Firebase for testing.

---

## 🛠️ Troubleshooting

| Issue                          | Solution  |
|--------------------------------|-----------|
| MissingStubError in tests      | Ensure mocks return expected data using `when().thenAnswer()` |
| iOS deployment issues         | Verify Apple Developer Program enrollment & provisioning profiles |
| Firebase setup errors         | Run `firebase login` and ensure correct project configuration |

---

## 📌 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```sh
   git checkout -b feature-new
   ```
3. Commit changes and push:
   ```sh
   git commit -m "Added new feature"
   git push origin feature-new
   ```
4. Submit a **Pull Request**.

---

## 📄 License

This project is licensed under the **MIT License**.
