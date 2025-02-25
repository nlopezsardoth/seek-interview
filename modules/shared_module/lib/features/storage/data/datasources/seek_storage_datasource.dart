import 'package:auth_module/data/models/user_model.dart';
import 'package:home_module/data/models/stored_qr_model.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';

abstract class SeekStorageDatasource {
  Future<bool> putUser({required UserModel recentUserLocal});
  Future<UserModel?> getUser();
  Future<void> saveQrScan(QrScan qrScan);
  Future<List<StoredQr>> getQrScanHistory();
  Future<void> clearQrHistory();
}
