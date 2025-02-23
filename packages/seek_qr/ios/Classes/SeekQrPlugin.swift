import Flutter
import UIKit
import VisionKit

@available(iOS 16.0, *)
public class SeekQrPlugin: NSObject, FlutterPlugin, QRScannerApi, DataScannerViewControllerDelegate {
    private var viewController: DataScannerViewController?
    private var completion: ((QRScanResult) -> Void)?

    // Registers the plugin with Flutter
    public static func register(with registrar: FlutterPluginRegistrar) {
        let api: SeekQRPlugin = SeekQrPlugin()
        QRScannerApiSetup.setUp(binaryMessenger: registrar.messenger(), api: api)
    }

    // Starts the QR scanner
    public func scanQRCode(completion: @escaping (QRScanResult) -> Void) {
        #if targetEnvironment(simulator)
        // Simulating QR scan in simulator
        completion(QRScanResult(code: "SIMULATED_QR_CODE", errorMessage: nil))
        #else
        guard DataScannerViewController.isSupported, DataScannerViewController.isAvailable else {
            completion(QRScanResult(code: nil, errorMessage: "Scanner not available"))
            return
        }
        
        self.completion = completion
        startScanning()
        #endif
    }

    private func startScanning() {
        let scanner = DataScannerViewController(
            recognizedDataTypes: [.barcode(symbologies: [.qr])],
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isHighFrameRateTrackingEnabled: false,
            isHighlightingEnabled: true
        )

        scanner.delegate = self
        self.viewController = scanner

        guard let rootVC = UIApplication.shared.windows.first?.rootViewController else { return }
        rootVC.present(scanner, animated: true) {
            try? scanner.startScanning()
        }
    }

    // Handles QR code scanning result
    public func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
        if let item = addedItems.first, case let .barcode(code) = item {
            completion?(QRScanResult(code: code.payloadStringValue, errorMessage: nil))
            closeScanner()
        }
    }

    private func closeScanner() {
        DispatchQueue.main.async {
            self.viewController?.stopScanning()
            self.viewController?.dismiss(animated: true)
            self.viewController = nil
        }
    }
}