

import 'package:cfc/screens/onboarding/sign_up.dart';
import 'package:cfc/widgets/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  var auth = FirebaseAuth.instance;


var isLogin = false;


  bool checkUserState() {
    return !(auth.currentUser == null);
  }

   userLoginCheck() {
    if (checkUserState() == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(() => Appbar());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(() => const CreateAccountScreen());
      });
    }
  }


 @override
  void onInit() {
    userLoginCheck();
    super.onInit();
  }
}