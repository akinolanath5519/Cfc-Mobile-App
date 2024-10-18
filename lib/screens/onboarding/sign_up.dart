import 'package:cfc/screens/onboarding/login.dart';
import 'package:cfc/widgets/app_decoration.dart';
import 'package:cfc/widgets/size_utility.dart';
import 'package:cfc/widgets/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../widgets/btn_gen.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/text_gen.dart';

class CreateAccountScreen extends GetView<AuthController> {
  const CreateAccountScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.adaptSize),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [Color(0XFFED0006), Color(0XFF20007F)]),
              ),
              height: SizeUtils.height,
              child: Form(
                // key: controller.formKeyCreateAccount,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 26.h),
                  child: Column(
                    children: [
                      SizedBox(height: 36.v),
                      Text(
                        "Create account",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 20.adaptSize,
                        ),
                      ),
                      SizedBox(height: 60.v),
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
                                      "First Name",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    CustomTextFormField(
                                      controller: controller.firstName,
                                      hintText: "Enter your first name",
                                      validator: (v) => v!.isEmpty
                                          ? "Enter your First Name"
                                          : null,
                                      textInputType: TextInputType.name,
                                      hintStyle: theme.textTheme.titleSmall!,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.h,
                                        vertical: 16.v,
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
                                      "Last Name",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    CustomTextFormField(
                                      controller: controller.lastName,
                                      hintText: "Enter your first name",
                                      validator: (v) => v!.isEmpty
                                          ? "Enter your Last Name"
                                          : null,
                                      textInputType: TextInputType.name,
                                      hintStyle: theme.textTheme.titleSmall!,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.h,
                                        vertical: 16.v,
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
                                      "Email",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    CustomTextFormField(
                                      controller: controller.emailController,
                                      hintText: "Enter your email address",
                                      // validator: controller.validateEmail,
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
                                      "Phone number",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    CustomTextFormField(
                                      controller:
                                          controller.phoneNumberController,
                                      hintText: "(050) 123 45 67",
                                      validator: (v) => v!.isEmpty
                                          ? "Enter your Phone Number"
                                          : null,
                                      textInputType: TextInputType.number,
                                      hintStyle: theme.textTheme.titleSmall!,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15.h,
                                        vertical: 16.v,
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
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    SizedBox(height: 1.v),
                                    Obx(() {
                                      return CustomTextFormField(
                                        controller:
                                            controller.passwordController,
                                        hintText: "Set password",
                                        //   validator: controller.validatePassword,
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
                              SizedBox(height: 29.v),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an account?",
                                      style: CustomTextStyles
                                          .titleMediumOnPrimaryContainer_1,
                                    ),
                                    TextSpan(
                                      text: " Log in",
                                      style: TextStyle(
                                          color: Color(0xFF20007F),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.offAll(
                                            LoginScreen(),
                                            //  binding: AuthBinding(),
                                          ); // Navigate to the sign-in screen
                                        },
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 11.v),
                              CustomElevatedButton(
                                onPressed: () {
                                  controller.signUpWithEmail();
                                },
                                text: "Continue",
                                buttonTextStyle:
                                    CustomTextStyles.bodyMediumErrorContainer,
                              ),
                              //  SizedBox(height: 30.v)
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
}
