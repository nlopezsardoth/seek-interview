import 'package:home_module/domain/repositories/qr_history_repository.dart';
import 'package:home_module/domain/repositories/qr_scanner_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  QrScannerRepository,
  QrHistoryRepository
])
class DatasourcesMockHelper {}