import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:shared_module/utils/typedefs.dart';

abstract class QrScannerRepository {
  ResultFuture<QrScan> scanQrCode();
}