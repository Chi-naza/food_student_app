import 'package:flutter/material.dart';
import 'package:food_app2/src/features/view/sigin.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),

            // image logo
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 380,
                width: 500,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffeb3254),
                ),
                child: Image.asset(
                  "assets/food_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),

            // title and sub-title section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "The Fastest Food",
                      style: GoogleFonts.spaceMono(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Delivery App In The Town",
                      style: GoogleFonts.spaceMono(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "pick your desired food item from the menu",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "There are more than 200 items",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),

            GestureDetector(
              onTap: () {
                Get.to(const SignIn(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(seconds: 1));
              },
              child: Container(
                height: 50,
                width: 350,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffeb3254),
                ),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.spaceMono(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
