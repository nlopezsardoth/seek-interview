import 'package:mockito/annotations.dart';
import 'package:seek_secure_store/seek_secure_store.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';

@GenerateMocks([
  SeekStorageDatasource,
  SeekStorage,
])
class SharedDatasourcesMockHelper {}