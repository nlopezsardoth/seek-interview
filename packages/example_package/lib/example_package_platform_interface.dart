import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'example_package_method_channel.dart';

abstract class ExamplePackagePlatform extends PlatformInterface {
  /// Constructs a ExamplePackagePlatform.
  ExamplePackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static ExamplePackagePlatform _instance = MethodChannelExamplePackage();

  /// The default instance of [ExamplePackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelExamplePackage].
  static ExamplePackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExamplePackagePlatform] when
  /// they register themselves.
  static set instance(ExamplePackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
