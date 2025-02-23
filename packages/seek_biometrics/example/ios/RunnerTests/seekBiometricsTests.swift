import XCTest
import LocalAuthentication

class SeekBiometricsTests: XCTestCase {

    func testBiometricAuthenticationSuccess() {
        let context = LAContext()
        context.localizedReason = "Testing biometrics"
        
        let expectation = self.expectation(description: "Biometric authentication should succeed")
        
        // Simulate biometric success
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Testing biometrics") { success, error in
            XCTAssertTrue(success, "Biometric authentication should succeed in mock")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }

    func testBiometricAuthenticationFailure() {
        let context = LAContext()
        context.localizedReason = "Testing biometrics"
        
        let expectation = self.expectation(description: "Biometric authentication should fail")
        
        // Simulate biometric failure
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Testing biometrics") { success, error in
            XCTAssertFalse(success, "Biometric authentication should fail in mock")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
}
