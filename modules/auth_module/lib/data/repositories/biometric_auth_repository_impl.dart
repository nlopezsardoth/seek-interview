import 'package:auth_module/data/datasources/seek_biometrics_datasource.dart';
import 'package:auth_module/data/mappers/auth_result_mapper.dart';
import 'package:auth_module/domain/entities/biometric_auth_parameters.dart';
import 'package:auth_module/domain/entities/biometric_auth_response.dart';
import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/errors/failures.dart';
import 'package:shared_module/utils/typedefs.dart';

class BiometricAuthRepositoryImpl implements BiometricAuthRepository {
  final SeekBiometricsDatasource biometricDataSource;

  BiometricAuthRepositoryImpl({required this.biometricDataSource});

  @override
  ResultFuture<BioAuthResult> biometricAuth({
    required BiometricAuthParams params,
  }) async {
    try {
      final result = await biometricDataSource.authenticate(
        title: params.title,
        subtitle: params.subtitle,
      );

      final authResult = AuthResultMapper.fromAuthResultDetails(result);

      return Right(authResult.result);
    } on BiometricAuthException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }

  @override
  ResultFuture<bool> biometricCanAuth() async {
    try {
      // Check if the device supports biometrics
      final supportsBiometrics =
          await biometricDataSource.deviceSupportsBiometrics();
      if (!supportsBiometrics) {
        return Right(false);
      }

      // Check if there are any enrolled biometrics
      final enrolledBiometrics =
          await biometricDataSource.getEnrolledBiometrics();
      final hasBiometrics = enrolledBiometrics.isNotEmpty;
      
      return Right(hasBiometrics);
    } on BiometricAuthException catch (e) {
      return Left(LocalFailure(message: e.message));
    }
  }
}
