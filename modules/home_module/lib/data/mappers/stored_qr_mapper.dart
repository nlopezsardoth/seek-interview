import 'package:home_module/data/models/stored_qr_model.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';

class StoreQrMapper {
  static QrScan fromModel(StoredQr model) {
    return QrScan(data: model.content, scannedAt: model.scannedAt);
  }

  static StoredQr toModel(QrScan entity) {
    return StoredQr(content: entity.data, scannedAt: entity.scannedAt);
  }

  static List<QrScan> fromModelList(List<StoredQr> models) {
    return models.map<QrScan>(fromModel).toList();
  }

  static List<StoredQr> toModelList(List<QrScan> entities) {
    return entities.map<StoredQr>(toModel).toList();
  }
}
