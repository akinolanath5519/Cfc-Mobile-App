
import 'package:cfc/screens/onboarding/sign_up.dart';
import 'package:cfc/widgets/btn_gen.dart';
import 'package:cfc/widgets/size_utility.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../widgets/app_decoration.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/text_gen.dart';
import '../../widgets/theme.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Color(0XFFED0006), Color(0XFF20007F)]),
          ),
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              height: SizeUtils.height,
              child: Form(
               // key: controller.loginCreateAccount,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 26.h),
                  child: Column(
                    children: [
                      SizedBox(height: 56.v),
                      Text(
                        "Log in",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 20.adaptSize,
                        ),
                      ),
                      SizedBox(height: 70.v),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 1.h),
                          padding: EdgeInsets.all(20.h),
                          decoration: AppDecoration.fillErrorContainer.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderTL15,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              
                              SizedBox(height: 9.v),
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 1.v),
                                    CustomTextFormField(
                                      controller: controller.emailController,
                                      hintText: "Enter your email address",
                                      hintStyle: CustomTextStyles
                                          .bodyMediumRobotoIndigo100,
                                      textInputType: TextInputType.emailAddress,
                                      // suffix: Container(
                                      //   margin: EdgeInsets.fromLTRB(
                                      //       30.h, 12.v, 15.h, 12.v),
                                      //   child: CustomImageView(
                                      //     imagePath: ImageConstant.imgProfile,
                                      //     height: 24.adaptSize,
                                      //     width: 24.adaptSize,
                                      //   ),
                                      // ),
                                      suffixConstraints: BoxConstraints(
                                        maxHeight: 49.v,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 29.v),
                              Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Password",
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 1.v),
                                    Obx(() {
                                      return CustomTextFormField(
                                        controller:
                                            controller.passwordController,
                                        hintText: "password",
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        suffix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              30.h, 0.v, 0.h, 0.v),
                                          child: IconButton(
                                              onPressed: () => controller
                                                  .seeCreatePassword(),
                                              icon: controller
                                                      .passwordVisibleCreate
                                                      .value
                                                  ? Icon(
                                                      Icons
                                                          .remove_red_eye_rounded,
                                                      color: Colors.grey[100],
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
                                                      color: Colors.grey,
                                                    )),
                                        ),
                                        suffixConstraints: BoxConstraints(
                                          maxHeight: 49.v,
                                        ),
                                        obscureText: controller
                                            .passwordVisibleCreate.value,
                                      );
                                    })
                                  ],
                                ),
                              ),
                              SizedBox(height: 9.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        // Get.to(
                                        //   () => ForgotPasswordScreen(),
                                        //   binding: AuthBinding(),
                                        // );
                                      },
                                      child: Text(
                                        "Forget password?",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ))
                                ],
                              ),
                              Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Don't you have an account?",
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainer_1,
                                    ),
                                    TextSpan(
                                      text: " Sign up",
                                      style: TextStyle(
                                          color: Color(0xFF20007F),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(
                                              CreateAccountScreen()); 
                                        },
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 11.v),
                              CustomElevatedButton(
                                onPressed: () {
                                  controller.signInWithEmail();
                                },
                                text: "Log in",
                                buttonTextStyle:
                                    CustomTextStyles.bodyMediumErrorContainer,
                              ),
                              SizedBox(height: 30.v)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget

  /// Section Widget
}
