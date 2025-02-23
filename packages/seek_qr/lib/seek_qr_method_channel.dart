import 'package:seek_qr/pigeons/qr_scanner.g.dart';

import 'seek_qr_platform_interface.dart';

/// An implementation of [SeekQrPlatform] that uses method channels.
class MethodChannelSeekQr extends SeekQrPlatform {
  final QRScannerApi _qrApi;

  MethodChannelSeekQr({QRScannerApi? qrApi}) 
      : _qrApi = qrApi ?? QRScannerApi();

  @override
  Future<QRScanResult> scanQRCode() async {
    return await _qrApi.scanQRCode();
  }

}
