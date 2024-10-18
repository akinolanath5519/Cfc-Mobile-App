import 'package:cfc/controller/auth_controller.dart';
import 'package:cfc/firebase_options.dart';
import 'package:cfc/screens/onboarding/splash_screen.dart';
import 'package:cfc/widgets/size_utility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/splash_screen_controller.dart'; // Import your custom Appbar widget

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  Get.put(AuthController());
  Get.put(SplashScreenController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cfc',
        theme: _buildAppTheme(),
        home: SplashScreen(), // Set Appbar as the home screen
      );
    });
  }

  /// Builds the app theme with custom AppBar settings.
  ThemeData _buildAppTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        toolbarHeight: 51, // Set AppBar height to 51px
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove AppBar shadow
      ),
    );
  }
}
