import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quadbtech/screens/initscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: LottieBuilder.asset("assets/lottie/Splash_animation.json"),
      ),
      nextScreen: InitScreen(),
      splashIconSize: 400,
      backgroundColor: Color(0xFF181C14),
    );
  }
}
