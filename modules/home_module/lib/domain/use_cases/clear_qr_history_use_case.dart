import 'package:dartz/dartz.dart';
import 'package:home_module/domain/repositories/qr_history_repository.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class ClearQrHistoryUseCase extends FutureUseCase<NoParams, NoParams> {
  final QrHistoryRepository qrHistoryRepository;

  ClearQrHistoryUseCase(this.qrHistoryRepository);

  @override
  ResultFuture<NoParams> call(NoParams input) async {
    final result = await qrHistoryRepository.clearQrHistory();
    return result.fold(
      (failure) => Left(failure),
      (_) => Right(NoParams()),
    );
  }
}
