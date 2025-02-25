import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:seek_qr/seek_qr_platform_interface.dart';

abstract class SeekQrDatasource implements SeekQrPlatform{
  @override
  Future<QRScanResult> scanQRCode();
}