import 'package:auth_module/domain/repositories/login_repository.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class ValidatePinUseCase extends FutureUseCase<bool, String> {
  final LoginRepository _repository;

  ValidatePinUseCase(this._repository);

  @override
  ResultFuture<bool> call(String pin) {
    return _repository.validatePin(
      pin: pin,
    );
  }
}
