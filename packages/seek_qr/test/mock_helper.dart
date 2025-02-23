import 'package:mockito/annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:seek_qr/seek_qr_platform_interface.dart';

@GenerateMocks([QRScannerApi], customMocks: [
  // ✅ Custom mock for SeekBiometricsPlatform to avoid "implements" issue
  MockSpec<SeekQrPlatform>(
    as: #MockSeekQrPlatform,
    mixingIn: [MockPlatformInterfaceMixin], // ✅ Fixes `verifyToken` assertion
  )
])

class SeekQrMockHelper {}