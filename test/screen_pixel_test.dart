import 'package:flutter_test/flutter_test.dart';
import 'package:screen_pixel/screen_pixel.dart';
import 'package:screen_pixel/screen_pixel_platform_interface.dart';
import 'package:screen_pixel/screen_pixel_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenPixelPlatform
    with MockPlatformInterfaceMixin
    implements ScreenPixelPlatform {

  @override
  Future<Map<String, double>> getResolution() => Future.value({'width': 1920.0, 'height': 1080.0});
}

void main() {
  final ScreenPixelPlatform initialPlatform = ScreenPixelPlatform.instance;

  test('$MethodChannelScreenPixel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenPixel>());
  });

  test('getResolution', () async {
    ScreenPixel screenPixelPlugin = ScreenPixel();
    MockScreenPixelPlatform fakePlatform = MockScreenPixelPlatform();
    ScreenPixelPlatform.instance = fakePlatform;

    final resolution = await screenPixelPlugin.getResolution();
    expect(resolution, isA<Map<String, double>>());
    expect(resolution['width'], 1920.0);
    expect(resolution['height'], 1080.0);
  });
}
