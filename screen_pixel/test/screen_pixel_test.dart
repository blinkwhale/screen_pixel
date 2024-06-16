import 'package:flutter_test/flutter_test.dart';
import 'package:screen_pixel/screen_pixel.dart';
import 'package:screen_pixel/screen_pixel_platform_interface.dart';
import 'package:screen_pixel/screen_pixel_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScreenPixelPlatform
    with MockPlatformInterfaceMixin
    implements ScreenPixelPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScreenPixelPlatform initialPlatform = ScreenPixelPlatform.instance;

  test('$MethodChannelScreenPixel is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScreenPixel>());
  });

  test('getPlatformVersion', () async {
    ScreenPixel screenPixelPlugin = ScreenPixel();
    MockScreenPixelPlatform fakePlatform = MockScreenPixelPlatform();
    ScreenPixelPlatform.instance = fakePlatform;

    expect(await screenPixelPlugin.getPlatformVersion(), '42');
  });
}
