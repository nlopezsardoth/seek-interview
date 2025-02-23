import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:seek_qr/pigeons/qr_scanner.g.dart';

import 'seek_qr_method_channel.dart';

abstract class SeekQrPlatform extends PlatformInterface {
  /// Constructs a SeekQrPlatform.
  SeekQrPlatform() : super(token: _token);

  static final Object _token = Object();

  static SeekQrPlatform _instance = MethodChannelSeekQr();

  /// The default instance of [SeekQrPlatform] to use.
  ///
  /// Defaults to [MethodChannelSeekQr].
  static SeekQrPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SeekQrPlatform] when
  /// they register themselves.
  static set instance(SeekQrPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  

  Future<QRScanResult> scanQRCode() async {
    throw UnimplementedError('authenticate() has not been implemented.');
  }
}
