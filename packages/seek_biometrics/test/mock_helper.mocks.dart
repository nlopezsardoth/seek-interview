// Mocks generated by Mockito 5.4.5 from annotations
// in seek_biometrics/test/mock_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;
import 'package:plugin_platform_interface/plugin_platform_interface.dart'
    as _i5;
import 'package:seek_biometrics/pigeons/pigeon.g.dart' as _i2;
import 'package:seek_biometrics/seek_biometrics_platform_interface.dart' as _i6;

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
  _FakeAuthResultDetails_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [SeekAuthApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeekAuthApi extends _i1.Mock implements _i2.SeekAuthApi {
  MockSeekAuthApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get pigeonVar_messageChannelSuffix =>
      (super.noSuchMethod(
            Invocation.getter(#pigeonVar_messageChannelSuffix),
            returnValue: _i3.dummyValue<String>(
              this,
              Invocation.getter(#pigeonVar_messageChannelSuffix),
            ),
          )
          as String);

  @override
  _i4.Future<bool> isDeviceSupported() =>
      (super.noSuchMethod(
            Invocation.method(#isDeviceSupported, []),
            returnValue: _i4.Future<bool>.value(false),
          )
          as _i4.Future<bool>);

  @override
  _i4.Future<bool> deviceCanSupportBiometrics() =>
      (super.noSuchMethod(
            Invocation.method(#deviceCanSupportBiometrics, []),
            returnValue: _i4.Future<bool>.value(false),
          )
          as _i4.Future<bool>);

  @override
  _i4.Future<List<_i2.AuthClassification>> getEnrolledBiometrics() =>
      (super.noSuchMethod(
            Invocation.method(#getEnrolledBiometrics, []),
            returnValue: _i4.Future<List<_i2.AuthClassification>>.value(
              <_i2.AuthClassification>[],
            ),
          )
          as _i4.Future<List<_i2.AuthClassification>>);

  @override
  _i4.Future<_i2.AuthResultDetails> authenticate(
    String? title,
    String? subtitle,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#authenticate, [title, subtitle]),
            returnValue: _i4.Future<_i2.AuthResultDetails>.value(
              _FakeAuthResultDetails_0(
                this,
                Invocation.method(#authenticate, [title, subtitle]),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResultDetails>);
}

/// A class which mocks [SeekBiometricsPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockSeekBiometricsPlatform extends _i1.Mock
    with _i5.MockPlatformInterfaceMixin
    implements _i6.SeekBiometricsPlatform {
  MockSeekBiometricsPlatform() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.AuthResultDetails> authenticate({
    required String? title,
    required String? subtitle,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#authenticate, [], {
              #title: title,
              #subtitle: subtitle,
            }),
            returnValue: _i4.Future<_i2.AuthResultDetails>.value(
              _FakeAuthResultDetails_0(
                this,
                Invocation.method(#authenticate, [], {
                  #title: title,
                  #subtitle: subtitle,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResultDetails>);

  @override
  _i4.Future<bool> deviceSupportsBiometrics() =>
      (super.noSuchMethod(
            Invocation.method(#deviceSupportsBiometrics, []),
            returnValue: _i4.Future<bool>.value(false),
          )
          as _i4.Future<bool>);

  @override
  _i4.Future<List<_i2.AuthClassification>> getEnrolledBiometrics() =>
      (super.noSuchMethod(
            Invocation.method(#getEnrolledBiometrics, []),
            returnValue: _i4.Future<List<_i2.AuthClassification>>.value(
              <_i2.AuthClassification>[],
            ),
          )
          as _i4.Future<List<_i2.AuthClassification>>);

  @override
  _i4.Future<bool> isDeviceSupported() =>
      (super.noSuchMethod(
            Invocation.method(#isDeviceSupported, []),
            returnValue: _i4.Future<bool>.value(false),
          )
          as _i4.Future<bool>);
}
