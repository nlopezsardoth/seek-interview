
import 'package:home_module/data/datasources/seek_qr_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:seek_qr/seek_qr.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';

@GenerateMocks([
  SeekQrDatasource,
  SeekQr,
  SeekStorageDatasource
])
class DatasourcesMockHelper {}
