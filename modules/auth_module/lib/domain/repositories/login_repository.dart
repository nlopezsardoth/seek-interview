import 'package:auth_module/domain/entities/user.dart';
import 'package:shared_module/utils/typedefs.dart';

abstract class LoginRepository {
  ResultFuture<bool> logInUser(User user);

  ResultFuture<bool> setNewPin({
    required String newPin,
  });


  ResultFuture<User?> getUser();


  ResultFuture<bool> validatePin({
    required String pin,
  });
}
