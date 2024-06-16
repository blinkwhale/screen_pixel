import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screen_pixel/screen_pixel_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelScreenPixel platform = MethodChannelScreenPixel();
  const MethodChannel channel = MethodChannel('screen_pixel');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
          (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getResolution':
            return {'width': 1920.0, 'height': 1080.0};
          default:
            return null;
        }
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getResolution', () async {
    final resolution = await platform.getResolution();
    expect(resolution, isA<Map<String, double>>());
    expect(resolution['width'], 1920.0);
    expect(resolution['height'], 1080.0);
  });
}
