import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_pixel/screen_pixel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _screenResolution = 'Unknown';
  final _screenPixelPlugin = ScreenPixel();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Map<String, double>? screenResolution;

    try {
      screenResolution = await _screenPixelPlugin.getResolution();
    } on PlatformException {
      screenResolution = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      if (screenResolution != null) {
        _screenResolution =
            'Width: ${screenResolution['width']}, Height: ${screenResolution['height']}';
      } else {
        _screenResolution = 'Failed to get screen resolution.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Screen Resolution: $_screenResolution\n'),
            ],
          ),
        ),
      ),
    );
  }
}
