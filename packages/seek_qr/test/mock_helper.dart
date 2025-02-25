import 'package:mockito/annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';
import 'package:seek_qr/seek_qr_platform_interface.dart';

@GenerateMocks([QRScannerApi], customMocks: [
  MockSpec<SeekQrPlatform>(
    as: #MockSeekQrPlatform,
    mixingIn: [MockPlatformInterfaceMixin],
  )
])

class SeekQrMockHelper {}