// Mocks generated by Mockito 5.4.5 from annotations
// in auth_module/test/data/mocks/repositories_mock_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:auth_module/domain/entities/biometric_auth_parameters.dart'
    as _i9;
import 'package:auth_module/domain/entities/biometric_auth_response.dart'
    as _i8;
import 'package:auth_module/domain/entities/user.dart' as _i6;
import 'package:auth_module/domain/repositories/biometric_auth_repository.dart'
    as _i7;
import 'package:auth_module/domain/repositories/login_repository.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_module/errors/failures.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [LoginRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepository extends _i1.Mock implements _i3.LoginRepository {
  MockLoginRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> logInUser(_i6.User? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #logInUser,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #logInUser,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> setNewPin(
          {required String? newPin}) =>
      (super.noSuchMethod(
        Invocation.method(
          #setNewPin,
          [],
          {#newPin: newPin},
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #setNewPin,
            [],
            {#newPin: newPin},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User?>> getUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.User?>>.value(
            _FakeEither_0<_i5.Failure, _i6.User?>(
          this,
          Invocation.method(
            #getUser,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.User?>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> validatePin(
          {required String? pin}) =>
      (super.noSuchMethod(
        Invocation.method(
          #validatePin,
          [],
          {#pin: pin},
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #validatePin,
            [],
            {#pin: pin},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}

/// A class which mocks [BiometricAuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBiometricAuthRepository extends _i1.Mock
    implements _i7.BiometricAuthRepository {
  MockBiometricAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.BioAuthResult>> biometricAuth(
          {required _i9.BiometricAuthParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #biometricAuth,
          [],
          {#params: params},
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i8.BioAuthResult>>.value(
                _FakeEither_0<_i5.Failure, _i8.BioAuthResult>(
          this,
          Invocation.method(
            #biometricAuth,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i8.BioAuthResult>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> biometricCanAuth() =>
      (super.noSuchMethod(
        Invocation.method(
          #biometricCanAuth,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #biometricCanAuth,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
