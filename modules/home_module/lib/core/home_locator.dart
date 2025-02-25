import 'package:home_module/data/datasources/seek_qr_datasource.dart';
import 'package:home_module/data/datasources/seek_qr_datasource_impl.dart';
import 'package:home_module/data/repositories/qr_history_repository_impl.dart';
import 'package:home_module/data/repositories/qr_scanner_repository_impl.dart';
import 'package:home_module/domain/repositories/qr_history_repository.dart';
import 'package:home_module/domain/repositories/qr_scanner_repository.dart';
import 'package:home_module/domain/use_cases/usecases.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:seek_qr/seek_qr.dart';
import 'package:shared_module/config/shared_locator.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';

final homeLocator = GetIt.instance;

Future<void> initHomeLocator() async {
  await _initHomeDependencies();
}

Future<void> _initHomeDependencies() async {
  homeLocator

    ..registerSingleton<SeekQrDatasource>(
      SeekQrDatasourceImpl(seekQr: SeekQr()),
    )
    ..registerLazySingleton<QrHistoryRepository>(
      () => QrHistoryRepositoryImpl(
        historyDatasource: sharedLocator<SeekStorageDatasource>(),
      ),
      )
    ..registerLazySingleton<QrScannerRepository>(
      () => QrScannerRepositoryImpl(
        scannerDatasource: homeLocator<SeekQrDatasource>(),
      ),
    )
    ..registerLazySingleton<ClearQrHistoryUseCase>(
      () => ClearQrHistoryUseCase(homeLocator<QrHistoryRepository>()),
    )
    ..registerLazySingleton<GetQrHistoryUseCase>(
      () => GetQrHistoryUseCase(homeLocator<QrHistoryRepository>()),
    )
    ..registerLazySingleton<SaveQrHistoryUseCase>(
      () => SaveQrHistoryUseCase(homeLocator<QrHistoryRepository>()),
    )
    ..registerLazySingleton<ScanQrUseCase>(
      () => ScanQrUseCase(homeLocator<QrScannerRepository>()),
    )

    ..registerLazySingleton<QrBloc>(
      () => QrBloc(
        scanQrUseCase: homeLocator<ScanQrUseCase>(),
        getQrHistoryUseCase: homeLocator<GetQrHistoryUseCase>(),
        saveQrHistoryUseCase: homeLocator<SaveQrHistoryUseCase>(),
        clearQrHistoryUseCase: homeLocator<ClearQrHistoryUseCase>(),
      ),
    );
}
