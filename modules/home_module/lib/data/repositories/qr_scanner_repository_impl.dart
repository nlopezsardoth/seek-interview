import 'package:dartz/dartz.dart';
import 'package:home_module/data/datasources/seek_qr_datasource.dart';
import 'package:home_module/data/mappers/qr_scan_result_mapper.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/repositories/qr_scanner_repository.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';
import 'package:shared_module/utils/typedefs.dart';

class QrScannerRepositoryImpl implements QrScannerRepository {
  
  final SeekQrDatasource scannerDatasource;

  QrScannerRepositoryImpl({required this.scannerDatasource});

  @override
  ResultFuture<QrScan> scanQrCode() async {
    try {
      final result = await scannerDatasource.scanQRCode();
      return Right(QrScanMapper.fromModel(result));
    } on QrScanException catch (e) {
      return Left(QrFailure(message: e.message));
    }
  }
}
