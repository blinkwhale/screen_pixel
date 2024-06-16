import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'screen_pixel_platform_interface.dart';

/// An implementation of [ScreenPixelPlatform] that uses method channels.
class MethodChannelScreenPixel extends ScreenPixelPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('screen_pixel');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
