
import 'example_package_platform_interface.dart';

class ExamplePackage {
  Future<String?> getPlatformVersion() {
    return ExamplePackagePlatform.instance.getPlatformVersion();
  }
}
