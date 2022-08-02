import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_timer/helpers/log.dart';
//import 'package:multi_timer/views/home/home_view.dart';
import 'package:multi_timer/views/timer/timer_view.dart';
import 'dart:io';
import 'package:desktop_window/desktop_window.dart' as window_size;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      window_size.DesktopWindow.setMinWindowSize(const Size(375, 700));
//    window_size.DesktopWindow.setFullScreen(false);
    }
  }
  setupLogger();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
//      home: HomeView(),
      home: TimerView(),
    );
  }
}
