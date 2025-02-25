import 'package:auth_module/data/models/user_model.dart';
import 'package:auth_module/domain/entities/user.dart';

class UserMapper {
  static UserModel toModel(User user) {
    return UserModel(
      id: user.id,
      pin: user.pin,
      isBiometricConfigured: user.isBiometricConfigured,
    );
  }

  static User fromModel(UserModel model) {
    return User(
      id: model.id,
      pin: model.pin,
      isBiometricConfigured: model.isBiometricConfigured,
    );
  }
}
