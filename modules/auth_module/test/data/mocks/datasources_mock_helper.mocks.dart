// Mocks generated by Mockito 5.4.5 from annotations
// in auth_module/test/data/mocks/datasources_mock_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:auth_module/data/datasources/seek_biometrics_datasource.dart'
    as _i3;
import 'package:auth_module/data/models/user_model.dart' as _i7;
import 'package:home_module/data/models/stored_qr_model.dart' as _i9;
import 'package:home_module/domain/entities/qr_scann_entity.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:seek_biometrics/pigeons/pigeon.g.dart' as _i2;
import 'package:seek_biometrics/seek_biometrics.dart' as _i5;
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource.dart'
    as _i6;

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

class _FakeAuthResultDetails_0 extends _i1.SmartFake
    implements _i2.AuthResultDetails {
  _FakeAuthResultDetails_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SeekBiometricsDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeekBiometricsDatasource extends _i1.Mock
    implements _i3.SeekBiometricsDatasource {
  MockSeekBiometricsDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AuthResultDetails> authenticate({
    required String? title,
    required String? subtitle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #authenticate,
          [],
          {
            #title: title,
            #subtitle: subtitle,
          },
        ),
        returnValue:
            _i4.Future<_i2.AuthResultDetails>.value(_FakeAuthResultDetails_0(
          this,
          Invocation.method(
            #authenticate,
            [],
            {
              #title: title,
              #subtitle: subtitle,
            },
          ),
        )),
      ) as _i4.Future<_i2.AuthResultDetails>);

  @override
  _i4.Future<List<_i2.AuthClassification>> getEnrolledBiometrics() =>
      (super.noSuchMethod(
        Invocation.method(
          #getEnrolledBiometrics,
          [],
        ),
        returnValue: _i4.Future<List<_i2.AuthClassification>>.value(
            <_i2.AuthClassification>[]),
      ) as _i4.Future<List<_i2.AuthClassification>>);

  @override
  _i4.Future<bool> deviceSupportsBiometrics() => (super.noSuchMethod(
        Invocation.method(
          #deviceSupportsBiometrics,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> isDeviceSupported() => (super.noSuchMethod(
        Invocation.method(
          #isDeviceSupported,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [SeekBiometrics].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeekBiometrics extends _i1.Mock implements _i5.SeekBiometrics {
  MockSeekBiometrics() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AuthResultDetails> authenticate({
    required String? title,
    required String? subtitle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #authenticate,
          [],
          {
            #title: title,
            #subtitle: subtitle,
          },
        ),
        returnValue:
            _i4.Future<_i2.AuthResultDetails>.value(_FakeAuthResultDetails_0(
          this,
          Invocation.method(
            #authenticate,
            [],
            {
              #title: title,
              #subtitle: subtitle,
            },
          ),
        )),
      ) as _i4.Future<_i2.AuthResultDetails>);

  @override
  _i4.Future<List<_i2.AuthClassification>> getEnrolledBiometrics() =>
      (super.noSuchMethod(
        Invocation.method(
          #getEnrolledBiometrics,
          [],
        ),
        returnValue: _i4.Future<List<_i2.AuthClassification>>.value(
            <_i2.AuthClassification>[]),
      ) as _i4.Future<List<_i2.AuthClassification>>);

  @override
  _i4.Future<bool> deviceSupportsBiometrics() => (super.noSuchMethod(
        Invocation.method(
          #deviceSupportsBiometrics,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<bool> isDeviceSupported() => (super.noSuchMethod(
        Invocation.method(
          #isDeviceSupported,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

/// A class which mocks [SeekStorageDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeekStorageDatasource extends _i1.Mock
    implements _i6.SeekStorageDatasource {
  MockSeekStorageDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool> putUser({required _i7.UserModel? recentUserLocal}) =>
      (super.noSuchMethod(
        Invocation.method(
          #putUser,
          [],
          {#recentUserLocal: recentUserLocal},
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<_i7.UserModel?> getUser() => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [],
        ),
        returnValue: _i4.Future<_i7.UserModel?>.value(),
      ) as _i4.Future<_i7.UserModel?>);

  @override
  _i4.Future<void> saveQrScan(_i8.QrScan? qrScan) => (super.noSuchMethod(
        Invocation.method(
          #saveQrScan,
          [qrScan],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<List<_i9.StoredQr>> getQrScanHistory() => (super.noSuchMethod(
        Invocation.method(
          #getQrScanHistory,
          [],
        ),
        returnValue: _i4.Future<List<_i9.StoredQr>>.value(<_i9.StoredQr>[]),
      ) as _i4.Future<List<_i9.StoredQr>>);

  @override
  _i4.Future<void> clearQrHistory() => (super.noSuchMethod(
        Invocation.method(
          #clearQrHistory,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
