import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';

class QrScanMapper {
  static QrScan fromModel(QRScanResult model) {
    return QrScan(data: model.code ?? "", scannedAt: DateTime.now());
  }

  static QRScanResult toModel(QrScan entity) {
    return QRScanResult(code: entity.data);
  }

  static List<QrScan> fromModelList(List<QRScanResult> models) {
    return models.map<QrScan>(fromModel).toList();
  }

  static List<QRScanResult> toModelList(List<QrScan> entities) {
    return entities.map<QRScanResult>(toModel).toList();
  }
}
