import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jogo/screens/main_menu.dart';
import 'package:jogo/style.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  runApp(
    const MyApp(),
  );
  // debugPrintGestureArenaDiagnostics = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Dino Survivors',
          theme: androidTheme(),
          home: const MainMenu(),
        );
      },
    );
  }
}
