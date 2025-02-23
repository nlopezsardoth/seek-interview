

import 'package:auth_module/domain/repositories/login_repository.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class SetNewPinUseCase
    extends FutureUseCase<bool, String> {
  final LoginRepository _repository;

  SetNewPinUseCase(this._repository);

  @override
  ResultFuture<bool> call(String newPin) {
    return _repository.setNewPin(
      newPin: newPin
    );
  }
}
