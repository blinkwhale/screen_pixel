import 'screen_pixel_platform_interface.dart';

class ScreenPixel {
  Future<Map<String, double>> getResolution() {
    return ScreenPixelPlatform.instance.getResolution();
  }
}
