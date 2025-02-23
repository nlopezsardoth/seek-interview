import 'package:auth_module/data/models/user_model.dart';

abstract class UserLocalDatasource {
  Future<bool> putUser({required UserModel recentUserLocal});

  Future<UserModel?> getUser();
}