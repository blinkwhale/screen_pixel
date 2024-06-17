import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screen_pixel_method_channel.dart';

abstract class ScreenPixelPlatform extends PlatformInterface {
  /// Constructs a ScreenPixelPlatform.
  ScreenPixelPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenPixelPlatform _instance = MethodChannelScreenPixel();

  /// The default instance of [ScreenPixelPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenPixel].
  static ScreenPixelPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenPixelPlatform] when
  /// they register themselves.
  static set instance(ScreenPixelPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<String, double>> getResolution() {
    throw UnimplementedError('getResolution() has not been implemented.');
  }
}
