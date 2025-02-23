import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/repositories/login_repository.dart';
import 'package:shared_module/use_cases/generic_use_cases.dart';
import 'package:shared_module/utils/typedefs.dart';

class GetUserUseCase extends FutureUseCase<User?, void> {
  final LoginRepository _repository;

  GetUserUseCase(this._repository);

  @override
  ResultFuture<User?> call(void input) {
    return _repository.getUser();
  }
}
