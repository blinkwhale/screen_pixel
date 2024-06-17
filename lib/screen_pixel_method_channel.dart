import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_pixel_platform_interface.dart';

/// An implementation of [ScreenPixelPlatform] that uses method channels.
class MethodChannelScreenPixel extends ScreenPixelPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_pixel');

  @override
  Future<Map<String, double>> getResolution() async {
    final resolution = await methodChannel.invokeMethod<Map>('getResolution');
    if (resolution == null) {
      throw PlatformException(
        code: 'UNAVAILABLE',
        message: 'Resolution data unavailable',
      );
    }
    return Map<String, double>.from(resolution);
  }
}
