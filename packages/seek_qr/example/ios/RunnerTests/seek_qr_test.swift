import XCTest
@testable import Runner

@available(iOS 16.0, *)
class SeekQrPluginTests: XCTestCase {

    var plugin: SeekQrPlugin!

    override func setUpWithError() throws {
        plugin = SeekQrPlugin()
    }

    func testScanQRCodeSimulator() {
        let expectation = self.expectation(description: "Simulated QR Code Scan")

        plugin.scanQRCode { result in
            XCTAssertEqual(result.code, "SIMULATED_QR_CODE", "The simulated scan result should match")
            XCTAssertNil(result.errorMessage, "There should be no error message")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 2)
    }
}