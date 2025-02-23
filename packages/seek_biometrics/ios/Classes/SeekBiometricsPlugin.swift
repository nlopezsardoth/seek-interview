import Flutter
import LocalAuthentication

public class SeekBiometricsPlugin: NSObject, FlutterPlugin, SeekAuthApi {

  public static func register(with registrar: any FlutterPluginRegistrar) {
    let messenger = registrar.messenger()
    let api: SeekAuthApi & NSObjectProtocol & FlutterPlugin = SeekBiometricsPlugin()
    SeekAuthApiSetup.setUp(binaryMessenger: messenger, api: SeekBiometricsPlugin())  // Use Pigeon's generated setup
    registrar.addApplicationDelegate(api)
  }

  func isDeviceSupported() -> Bool {
    let context = LAContext()
    var error: NSError?

    return context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
  }

  func deviceCanSupportBiometrics() -> Bool {
    let context = LAContext()
    var error: NSError?

    // Check if the device supports biometric authentication (Face ID or Touch ID)
    return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
  }

  func getEnrolledBiometrics() -> [AuthClassification] {
    let context = LAContext()
    var error: NSError?

    guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
      return []
    }

    switch context.biometryType {
    case .faceID:
      return [.face]
    case .touchID:
      return [.fingerprint]
    case .none:
      return []
    case .opticID:
      return [.iris]
    @unknown default:
      return []
    }
  }

  func authenticate(
    title: String, subtitle: String,
    completion: @escaping (Result<AuthResultDetails, any Error>) -> Void
  ) {
    let context = LAContext()
    context.localizedReason = title
    context.localizedFallbackTitle = title

    var error: NSError?

    // Check if authentication is available
    guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
      completion(
        .success(AuthResultDetails(result: .error, errorMessage: "Biometrics not available")))
      return
    }

    #if targetEnvironment(simulator)
      print("⚠️ Running in iOS Simulator - Mocking Biometric Success")
      completion(.success(AuthResultDetails(result: .success, errorMessage: nil)))
      return
    #endif

    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: title) {
      success, authError in
      DispatchQueue.main.async {
        if success {
          completion(.success(AuthResultDetails(result: .success, errorMessage: nil)))
        } else {
          let errorMessage = authError?.localizedDescription ?? "Authentication failed"
          completion(.success(AuthResultDetails(result: .error, errorMessage: errorMessage)))
        }
      }
    }
  }
}
