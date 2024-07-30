import 'package:flutter/material.dart';

import 'package:food_app2/src/features/controller/auth_controller.dart';
import 'package:food_app2/src/features/view/splashscreen.dart';
import 'package:food_app2/src/service/my_theme.dart';
import 'package:food_app2/src/service/theme_service.dart';
import 'package:food_app2/src/utilities/notification.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Always initialize Awesome Notifications
  await NotificationController.initializeLocalNotifications();
  await NotificationController.initializeIsolateReceivePort();

  // initialize auth conntroller
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var auth = Get.find<AuthController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: auth.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(),
    );
  }

  // Futur isDarkMode()async{
  //   var sp = await SharedPreferences.getInstance();
  //   return sp.getBool("theme") ?? false;
  // }
}
