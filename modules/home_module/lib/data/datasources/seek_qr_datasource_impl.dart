import 'package:home_module/data/datasources/seek_qr_datasource.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:seek_qr/seek_qr.dart';
import 'package:shared_module/errors/exceptions.dart';

class SeekQrDatasourceImpl implements SeekQrDatasource {
  final SeekQr _seekQr;

  SeekQrDatasourceImpl({required SeekQr seekQr}) : _seekQr = seekQr;

  @override
  Future<QRScanResult> scanQRCode() async {
    try {
      return await _seekQr.scanQRCode();
    } catch (e) {
      throw QrScanException(message: e.toString());
    }

  }
}
