import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashScreenController(),
        builder: (viewModel) {
        return Scaffold(
          backgroundColor: Color(0xFFE01B28),
          body: Container(
            child: Center(
              child: Image.asset(
                "assets/images/image2.png",
                scale: 2,
              ),
            ),
          ),
        );
      }
    );
  }
}
