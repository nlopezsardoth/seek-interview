import 'package:mockito/annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';
import 'package:seek_biometrics/seek_biometrics_platform_interface.dart';

@GenerateMocks([SeekAuthApi], customMocks: [
  MockSpec<SeekBiometricsPlatform>(
    as: #MockSeekBiometricsPlatform,
    mixingIn: [MockPlatformInterfaceMixin],
  )
])

class SeekBiometricsMockHelper {}