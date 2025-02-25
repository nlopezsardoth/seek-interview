import 'package:auth_module/data/datasources/seek_biometrics_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:seek_biometrics/seek_biometrics.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';


@GenerateMocks([
  SeekBiometricsDatasource,
  SeekBiometrics,
  SeekStorageDatasource
])
class DatasourcesMockHelper {}
