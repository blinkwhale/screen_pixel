import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:screen_pixel/screen_pixel.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getResolution test', (WidgetTester tester) async {
    final ScreenPixel screenPixelPlugin = ScreenPixel();
    final resolution = await screenPixelPlugin.getResolution();
    expect(resolution, isNotNull);
    expect(resolution['width'], isNotNull);
    expect(resolution['height'], isNotNull);
  });
}
