import 'package:auth_module/data/datasources/user_local_datasource.dart';
import 'package:auth_module/data/datasources/user_local_datasource_impl.dart';
import 'package:auth_module/data/repositories/biometric_auth_repository_impl.dart';
import 'package:auth_module/data/repositories/login_repository_impl.dart';
import 'package:auth_module/domain/repositories/biometric_auth_repository.dart';
import 'package:auth_module/domain/repositories/login_repository.dart';
import 'package:auth_module/domain/usecases/use_cases.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:seek_secure_store/seek_secure_store.dart';

final authLocator = GetIt.instance;

Future<void> initAuthLocator() async {
  await _initAuthDependencies();
}

Future<void> _initAuthDependencies() async {
  authLocator
    ..registerSingleton<UserLocalDatasource>(
      UserLocalDatasourceImpl(storage: SeekStorage()),
    )
    ..registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(
        localDatasource: authLocator<UserLocalDatasource>(),
      ),
    )
    ..registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(authLocator<LoginRepository>()),
    )
    ..registerLazySingleton<LogInUseCase>(
      () => LogInUseCase(authLocator<LoginRepository>()),
    )
    ..registerLazySingleton<SetNewPinUseCase>(
      () => SetNewPinUseCase(authLocator<LoginRepository>()),
    )
    ..registerLazySingleton<ValidatePinUseCase>(
      () => ValidatePinUseCase(authLocator<LoginRepository>()),
    )
    ..registerLazySingleton<BiometricAuthRepository>(
      () => BiometricAuthRepositoryImpl(),
    )
    ..registerLazySingleton<BiometricAuthUseCase>(
      () => BiometricAuthUseCase(authLocator<BiometricAuthRepository>()),
    )
    ..registerLazySingleton<CheckBiometricUseCase>(
      () => CheckBiometricUseCase(authLocator<BiometricAuthRepository>()),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        loginUser: authLocator<LogInUseCase>(),
      ),
    )
    ..registerLazySingleton<LoginBloc>(
      () => LoginBloc(
        getUser: authLocator<GetUserUseCase>(),
        validatePin: authLocator<ValidatePinUseCase>(),
        setNewPin: authLocator<SetNewPinUseCase>(),
        biometricAuth: authLocator<BiometricAuthUseCase>(),
        checkBiometric: authLocator<CheckBiometricUseCase>(),
        authBloc: authLocator<AuthBloc>(),
      )..add(LoginCheckStatus()),
    
    );
}
