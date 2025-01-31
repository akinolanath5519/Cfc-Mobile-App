import 'package:cfc/widgets/bottom_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/onboarding/sign_up.dart';

class AuthController extends GetxController {
  RxBool passwordVisibleCreate = true.obs;
  RxBool passwordVisibleCreateTwo = true.obs;

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController otpCreateUser = TextEditingController();
  String otpCreateUserTe = "";
  String otpCreateUserOne = "";

  TextEditingController passwordController = TextEditingController();

  seeCreatePassword() {
    passwordVisibleCreate.value = !passwordVisibleCreate.value;
    update();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUpWithEmail() async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    try {
      // Check if input fields are not empty
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty ||
          firstName.text.trim().isEmpty ||
          lastName.text.trim().isEmpty ||
          phoneNumberController.text.trim().isEmpty) {
        throw Exception("Please fill in all fields.");
      }

      // Create user with email and password
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Add user details to Firestore
      await firestore.collection("user").doc(userCredential.user!.uid).set({
        "first_name": firstName.text.trim(),
        "last_name": lastName.text.trim(),
        "email": emailController.text.trim(),
        "phone_number": phoneNumberController.text.trim(),
        "created_at": Timestamp.now(),
      });

      // Success feedback
      Get.offAll(() => const Appbar());

      Get.snackbar("Success", "User registered successfully!",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      // Error feedback
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  Future<void> signInWithEmail() async {
    final auth = FirebaseAuth.instance;

    try {
      // Validate email and password fields
      if (emailController.text.trim().isEmpty ||
          passwordController.text.trim().isEmpty) {
        throw Exception("Please enter both email and password.");
      }

      // Attempt to sign in
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => const Appbar());

      // Success feedback
      Get.snackbar(
        "Success",
        "Signed in successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      // Error feedback
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  // FirebaseApp

  Future<void> forgotPassword() async {
    final auth = FirebaseAuth.instance;

    try {
      // Validate if email is provided
      if (emailController.text.trim().isEmpty) {
        throw Exception("Please enter your email.");
      }

      // Send password reset email
      await auth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      // Success feedback
      Get.snackbar(
        "Success",
        "Password reset email sent! Check your inbox.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      // Error feedback
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> logout() async {
    final auth = FirebaseAuth.instance;

    try {
      // Log the user out
      await auth.signOut();
      Get.offAll(() => const CreateAccountScreen());

      // Success feedback
      Get.snackbar(
        "Success",
        "Logged out successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } catch (e) {
      // Error feedback
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<Map<String, dynamic>?> getUserProfileFromFirestore() async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    final user = auth.currentUser;

    if (user != null) {
      // Retrieve user document from Firestore using UID
      DocumentSnapshot userDoc =
          await firestore.collection("user").doc(user.uid).get();

      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        throw Exception("User profile not found in Firestore.");
      }
    } else {
      throw Exception("No user is currently logged in.");
    }
  }
}
