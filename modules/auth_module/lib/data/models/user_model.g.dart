// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      pin: json['pin'] as String,
      isBiometricConfigured: json['isBiometricConfigured'] as bool? ?? false,
      biometricID: json['biometricID'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'pin': instance.pin,
      'isBiometricConfigured': instance.isBiometricConfigured,
      'biometricID': instance.biometricID,
    };
