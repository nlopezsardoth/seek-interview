import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/usecases/use_cases.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/mocks/use_cases_mock_helper.mocks.dart';
import '../mocks/presentation_mock_helper.mocks.dart';

@GenerateMocks([
  GetUserUseCase,
  ValidatePinUseCase,
  SetNewPinUseCase,
  BiometricAuthUseCase,
  CheckBiometricUseCase,
  AuthBloc,
])
void main() {
  late LoginBloc loginBloc;
  late MockGetUserUseCase mockGetUserUseCase;
  late MockValidatePinUseCase mockValidatePinUseCase;
  late MockSetNewPinUseCase mockSetNewPinUseCase;
  late MockBiometricAuthUseCase mockBiometricAuthUseCase;
  late MockCheckBiometricUseCase mockCheckBiometricUseCase;
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockGetUserUseCase = MockGetUserUseCase();
    mockValidatePinUseCase = MockValidatePinUseCase();
    mockSetNewPinUseCase = MockSetNewPinUseCase();
    mockBiometricAuthUseCase = MockBiometricAuthUseCase();
    mockCheckBiometricUseCase = MockCheckBiometricUseCase();
    mockAuthBloc = MockAuthBloc();

    loginBloc = LoginBloc(
      getUser: mockGetUserUseCase,
      validatePin: mockValidatePinUseCase,
      setNewPin: mockSetNewPinUseCase,
      biometricAuth: mockBiometricAuthUseCase,
      checkBiometric: mockCheckBiometricUseCase,
      authBloc: mockAuthBloc,
    );
  });

  tearDown(() {
    loginBloc.close();
  });

  group('LoginBloc', () {
    const testUser = User.empty;

    blocTest<LoginBloc, LoginState>(
      'GIVEN a user WHEN checking login status THEN sets correct login flow',
      build: () {
        when(mockGetUserUseCase.call(any)).thenAnswer((_) async => Right(testUser));
        when(mockCheckBiometricUseCase.call(any)).thenAnswer((_) async => Right(true));
        return loginBloc;
      },
      act: (bloc) => bloc.add(LoginCheckStatus()),
      expect: () => [
    const LoginState(flow: LoginFlow.initial, canUseBiometrics: true),
    const LoginState(flow: LoginFlow.requireBiometric, canUseBiometrics: true),
      ],
    );


});
}
