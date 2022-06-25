import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:provider/provider.dart';
import 'package:spotify/model/current_song.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'views/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    // await DesktopWindow.setMinWindowSize(const Size(600, 800));
    await Window.initialize();
    if (Platform.isWindows) {
      await Window.hideWindowControls();
    }
  }

  runApp(ChangeNotifierProvider(
      create: (context) => CurrentSongModel(), child: const MyApp()));
  if (Platform.isWindows) {
    doWhenWindowReady(() async {
      appWindow
        ..minSize = Size(600, 800)
        ..size = Size(720, 540)
        ..alignment = Alignment.center
        ..show();
      await Window.setEffect(
        effect: WindowEffect.acrylic,
        color: Color(0xCC222222),
      );
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        accentColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ),
      ),
      home: DashBoard(),
    );
  }
}
