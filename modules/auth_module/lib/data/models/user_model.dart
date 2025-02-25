import 'package:auth_module/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {

  const UserModel({
    required super.id,
    required super.pin,
    super.isBiometricConfigured = false,
  });

  /// Auto-generate these methods using json_serializable
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}