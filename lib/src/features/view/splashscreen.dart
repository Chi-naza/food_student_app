import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:food_app2/src/features/view/onboardingscreen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateOnboardingScreen();
    super.initState();
  }

  //delay and go to onboarding screen
  void _navigateOnboardingScreen() async {
    await Future.delayed(const Duration(seconds: 10));
    Get.offAll(const OnboardingScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeb3254),
      body: Center(
        child: AnimatedTextKit(repeatForever: true, animatedTexts: [
          FadeAnimatedText("BiteBliss",
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }
}
