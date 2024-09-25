import 'package:flutter/material.dart';
import 'package:quadbtech/config/splash_screen.dart';
import 'package:quadbtech/config/theme.dart';
import 'package:quadbtech/screens/initscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyAppTheme.HighMode,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
