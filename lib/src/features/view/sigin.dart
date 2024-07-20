import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app2/src/features/controller/auth_controller.dart';
import 'package:food_app2/src/features/view/homemain.dart';
import 'package:food_app2/src/features/view/registerpage.dart';
import 'package:food_app2/src/utilities/loadingwidget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //password visiblity
  bool _isvisible = true;

  // conntroller
  var authController = Get.find<AuthController>();

  // text controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 20));
    Get.to(const HomePageMain());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
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
                      "Welcome back,Sign In to proceed",
                      style: GoogleFonts.spaceMono(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // user sigin
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 50,
                        width: 400,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xffeb3254),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            )),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 50,
                        width: 400,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _isvisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isvisible = !_isvisible;
                                  });
                                },
                                icon: _isvisible
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Color(0xffeb3254),
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Color(0xffeb3254),
                                      )),
                            hintText: "Enter your passwod",
                            prefixIcon: const Icon(
                              Icons.security,
                              color: Color(0xffeb3254),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            )),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                            fillColor: Colors.grey.shade300,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // forget pasword
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Forgot password?",
                textAlign: TextAlign.end,
                style: GoogleFonts.spaceMono(
                    color: const Color(0xffeb3254),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // sigin button

            Obx(() {
              return GestureDetector(
                onTap: () {
                  print("object");

                  authController.loginUser(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  // goToNextPage();
                },
                child: authController.isLoading.value
                    ? loadingWidget()
                    : Container(
                        height: 50,
                        width: 350,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffeb3254),
                        ),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.spaceMono(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              );
            }),

            const SizedBox(
              height: 10,
            ),

            // don't have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const RegisterPage(),
                        transition: Transition.fade,
                        duration: const Duration(seconds: 1));
                  },
                  splashColor: const Color(0xffeb3254),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.spaceMono(
                        color: const Color(0xffeb3254),
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
