
import 'screen_pixel_platform_interface.dart';

class ScreenPixel {
  Future<String?> getPlatformVersion() {
    return ScreenPixelPlatform.instance.getPlatformVersion();
  }
}
