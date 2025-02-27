// Mocks generated by Mockito 5.4.5 from annotations
// in auth_module/test/presentation/blocs/login_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:auth_module/domain/entities/biometric_auth_parameters.dart'
    as _i12;
import 'package:auth_module/domain/entities/biometric_auth_response.dart'
    as _i11;
import 'package:auth_module/domain/entities/user.dart' as _i10;
import 'package:auth_module/domain/repositories/biometric_auth_repository.dart'
    as _i3;
import 'package:auth_module/domain/usecases/use_cases.dart' as _i7;
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart' as _i4;
import 'package:bloc/bloc.dart' as _i13;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_module/errors/failures.dart' as _i9;
import 'package:shared_module/ui_utils/overlay/error_bottom_sheet_model.dart'
    as _i6;
import 'package:shared_module/ui_utils/overlay/loading_status_model.dart'
    as _i5;

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

class _FakeBiometricAuthRepository_1 extends _i1.SmartFake
    implements _i3.BiometricAuthRepository {
  _FakeBiometricAuthRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthState_2 extends _i1.SmartFake implements _i4.AuthState {
  _FakeAuthState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoadingStatusCubit_3 extends _i1.SmartFake
    implements _i5.LoadingStatusCubit {
  _FakeLoadingStatusCubit_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeErrorBottomSheetCubit_4 extends _i1.SmartFake
    implements _i6.ErrorBottomSheetCubit {
  _FakeErrorBottomSheetCubit_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetUserUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserUseCase extends _i1.Mock implements _i7.GetUserUseCase {
  MockGetUserUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.User?>> call(dynamic input) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [input],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, _i10.User?>>.value(
            _FakeEither_0<_i9.Failure, _i10.User?>(
          this,
          Invocation.method(
            #call,
            [input],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i10.User?>>);
}

/// A class which mocks [ValidatePinUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockValidatePinUseCase extends _i1.Mock
    implements _i7.ValidatePinUseCase {
  MockValidatePinUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> call(String? pin) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [pin],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, bool>>.value(
            _FakeEither_0<_i9.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [pin],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, bool>>);
}

/// A class which mocks [SetNewPinUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSetNewPinUseCase extends _i1.Mock implements _i7.SetNewPinUseCase {
  MockSetNewPinUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> call(String? newPin) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [newPin],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, bool>>.value(
            _FakeEither_0<_i9.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [newPin],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, bool>>);
}

/// A class which mocks [BiometricAuthUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockBiometricAuthUseCase extends _i1.Mock
    implements _i7.BiometricAuthUseCase {
  MockBiometricAuthUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.BiometricAuthRepository get biometricAuthRepository =>
      (super.noSuchMethod(
        Invocation.getter(#biometricAuthRepository),
        returnValue: _FakeBiometricAuthRepository_1(
          this,
          Invocation.getter(#biometricAuthRepository),
        ),
      ) as _i3.BiometricAuthRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i11.BioAuthResult>> call(
          _i12.BiometricAuthParams? input) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [input],
        ),
        returnValue:
            _i8.Future<_i2.Either<_i9.Failure, _i11.BioAuthResult>>.value(
                _FakeEither_0<_i9.Failure, _i11.BioAuthResult>(
          this,
          Invocation.method(
            #call,
            [input],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, _i11.BioAuthResult>>);
}

/// A class which mocks [CheckBiometricUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCheckBiometricUseCase extends _i1.Mock
    implements _i7.CheckBiometricUseCase {
  MockCheckBiometricUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.BiometricAuthRepository get biometricRepository => (super.noSuchMethod(
        Invocation.getter(#biometricRepository),
        returnValue: _FakeBiometricAuthRepository_1(
          this,
          Invocation.getter(#biometricRepository),
        ),
      ) as _i3.BiometricAuthRepository);

  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> call(dynamic input) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [input],
        ),
        returnValue: _i8.Future<_i2.Either<_i9.Failure, bool>>.value(
            _FakeEither_0<_i9.Failure, bool>(
          this,
          Invocation.method(
            #call,
            [input],
          ),
        )),
      ) as _i8.Future<_i2.Either<_i9.Failure, bool>>);
}

/// A class which mocks [AuthBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthBloc extends _i1.Mock implements _i4.AuthBloc {
  MockAuthBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.AuthState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeAuthState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i4.AuthState);

  @override
  _i8.Stream<_i4.AuthState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i8.Stream<_i4.AuthState>.empty(),
      ) as _i8.Stream<_i4.AuthState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i5.LoadingStatusCubit get loadingStatus => (super.noSuchMethod(
        Invocation.getter(#loadingStatus),
        returnValue: _FakeLoadingStatusCubit_3(
          this,
          Invocation.getter(#loadingStatus),
        ),
      ) as _i5.LoadingStatusCubit);

  @override
  _i6.ErrorBottomSheetCubit get errorBottomSheetStatus => (super.noSuchMethod(
        Invocation.getter(#errorBottomSheetStatus),
        returnValue: _FakeErrorBottomSheetCubit_4(
          this,
          Invocation.getter(#errorBottomSheetStatus),
        ),
      ) as _i6.ErrorBottomSheetCubit);

  @override
  void add(_i4.AuthEvent? event) => super.noSuchMethod(
        Invocation.method(
          #add,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onEvent(_i4.AuthEvent? event) => super.noSuchMethod(
        Invocation.method(
          #onEvent,
          [event],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i4.AuthState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void on<E extends _i4.AuthEvent>(
    _i13.EventHandler<E, _i4.AuthState>? handler, {
    _i13.EventTransformer<E>? transformer,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #on,
          [handler],
          {#transformer: transformer},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onTransition(
          _i13.Transition<_i4.AuthEvent, _i4.AuthState>? transition) =>
      super.noSuchMethod(
        Invocation.method(
          #onTransition,
          [transition],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void onChange(_i13.Change<_i4.AuthState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
}
