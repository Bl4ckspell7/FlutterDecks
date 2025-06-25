import 'dart:io' show Platform;

import 'package:dynamic_color/dynamic_color.dart' show DynamicColorBuilder;
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_decks/src/presentation/bottom_navigation_bar.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class FlutterDecksApp extends StatefulWidget {
  const FlutterDecksApp({super.key});
  @override
  FlutterDecksAppState createState() => FlutterDecksAppState();
}

class FlutterDecksAppState extends State<FlutterDecksApp> {
  static final _defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      setOptimalDisplayMode();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: 'Flutter Decks',
          theme: ThemeData(
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          home: const BottomNavigationBar(),
        );
      },
    );
  }

  Future<void> setOptimalDisplayMode() async {
    List<DisplayMode> supportedModes = <DisplayMode>[];

    try {
      supportedModes = await FlutterDisplayMode.supported;
    } on PlatformException {
      /// e.code =>
      /// noAPI - No API support. Only Marshmallow and above.
      /// noActivity - Activity is not available. Probably app is in background.
    }

    final DisplayMode active = await FlutterDisplayMode.active;

    final List<DisplayMode> sameResolution =
        supportedModes
            .where(
              (DisplayMode m) =>
                  m.width == active.width && m.height == active.height,
            )
            .toList()
          ..sort(
            (DisplayMode a, DisplayMode b) =>
                b.refreshRate.compareTo(a.refreshRate),
          );

    final DisplayMode mostOptimalMode =
        sameResolution.isNotEmpty ? sameResolution.first : active;

    await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
  }
}
