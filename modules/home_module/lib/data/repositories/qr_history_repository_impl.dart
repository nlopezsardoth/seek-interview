import 'package:dartz/dartz.dart';
import 'package:home_module/data/mappers/stored_qr_mapper.dart';

import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/repositories/qr_history_repository.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart';
import 'package:shared_module/utils/typedefs.dart';

class QrHistoryRepositoryImpl implements QrHistoryRepository {
  final SeekStorageDatasource historyDatasource;

  QrHistoryRepositoryImpl({required this.historyDatasource});

  @override
  ResultFuture<List<QrScan>> getQrScanHistory() async {
    try {
      final history = await historyDatasource.getQrScanHistory();
      return Right(StoreQrMapper.fromModelList(history));
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<NoParams> saveQrScan(QrScan scan) async {
    try {
      await historyDatasource.saveQrScan(scan);
      return Right(NoParams());
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<NoParams> clearQrHistory() async {
    try {
      await historyDatasource.clearQrHistory();
      return Right(NoParams());
    } on LocalDatabaseException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }
}
