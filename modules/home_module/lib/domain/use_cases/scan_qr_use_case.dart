import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/repositories/qr_scanner_repository.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class ScanQrUseCase extends FutureUseCase<QrScan, NoParams> {
  final QrScannerRepository qrScannerRepository;

  ScanQrUseCase(this.qrScannerRepository);

  @override
  ResultFuture<QrScan> call(NoParams input) async {
    return await qrScannerRepository.scanQrCode();
  }
}