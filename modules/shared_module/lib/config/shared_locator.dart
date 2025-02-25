import 'package:get_it/get_it.dart';
import 'package:seek_secure_store/seek_secure_store.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource_impl.dart';

final sharedLocator = GetIt.instance;

Future<void> initSharedLocator() async {
  await _initSharedDependencies();
}

Future<void> _initSharedDependencies() async {
  sharedLocator.registerSingleton<SeekStorageDatasource>(
    SeekStorageDatasourceImpl(storage: SeekStorage()),
  );
}
