import 'package:dartz/dartz.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/repositories/qr_history_repository.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class SaveQrHistoryUseCase extends FutureUseCase<NoParams, QrScan> {
  final QrHistoryRepository qrHistoryRepository;

  SaveQrHistoryUseCase(this.qrHistoryRepository);

  @override
  ResultFuture<NoParams> call(QrScan input) async {
     final result = await qrHistoryRepository.saveQrScan(input);
    return result.fold(
      (failure) => Left(failure),
      (_) => Right(NoParams()),
    );
  }
}
