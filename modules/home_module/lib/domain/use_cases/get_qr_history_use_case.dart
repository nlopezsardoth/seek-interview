import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/repositories/qr_history_repository.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class GetQrHistoryUseCase extends FutureUseCase<List<QrScan>, NoParams> {
  final QrHistoryRepository qrHistoryRepository;

  GetQrHistoryUseCase(this.qrHistoryRepository);

  @override
  ResultFuture<List<QrScan>> call(NoParams input) {
    return qrHistoryRepository.getQrScanHistory();
  }
}
