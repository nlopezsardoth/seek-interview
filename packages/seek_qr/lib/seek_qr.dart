
import 'package:seek_qr/pigeons/qr_scanner.g.dart';

import 'seek_qr_platform_interface.dart';

class SeekQr {
  Future<QRScanResult> scanQRCode() async {
    return SeekQrPlatform.instance.scanQRCode();
  }
}
