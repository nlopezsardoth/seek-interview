import 'package:flutter_test/flutter_test.dart';
import 'package:example_package/example_package.dart';
import 'package:example_package/example_package_platform_interface.dart';
import 'package:example_package/example_package_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockExamplePackagePlatform
    with MockPlatformInterfaceMixin
    implements ExamplePackagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ExamplePackagePlatform initialPlatform = ExamplePackagePlatform.instance;

  test('$MethodChannelExamplePackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelExamplePackage>());
  });

  test('getPlatformVersion', () async {
    ExamplePackage examplePackagePlugin = ExamplePackage();
    MockExamplePackagePlatform fakePlatform = MockExamplePackagePlatform();
    ExamplePackagePlatform.instance = fakePlatform;

    expect(await examplePackagePlugin.getPlatformVersion(), '42');
  });
}
