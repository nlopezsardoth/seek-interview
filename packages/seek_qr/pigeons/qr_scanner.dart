import 'package:pigeon/pigeon.dart';

class QRScanResult {
  QRScanResult({required this.code, this.errorMessage});

  /// The scanned QR code result.
  final String? code;

  /// Error message in case of failure.
  final String? errorMessage;
}
 
@HostApi()
abstract class QRScannerApi {
  /// Starts the QR scanning process.
  @async
  QRScanResult scanQRCode();
}
