import 'dart:io';

import 'package:english_test/controller/login_controller.dart';
import 'package:english_test/views/signUp.dart';
import 'package:english_test/widgets/TextBox.dart';
import 'package:english_test/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../controller/social_auth_controller.dart';
import '../widgets/HeaderText.dart';
import '../widgets/customButton.dart';
import '../widgets/skip_button.dart';
import 'html_view.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a SocialController object
    SocialController authController = Get.put(SocialController());
    // Create a LoginController object
    LoginController controller = Get.put(LoginController());

    // Create a global key for the Form widget
    final formKey = GlobalKey<FormState>();
    // Create TextEditingController objects for the email and password TextField widgets
    TextEditingController emailBox = TextEditingController();
    TextEditingController passwordBox = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFE),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    // HeaderText widget displays a header
                    headerText("Sign In"),
                    // Skip button allows the user to skip the login process
                    Positioned(right: 20, top: 50, child: skip())
                  ],
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // TextBox widget displays a text field for the user to enter their email
                        textBox("Email", emailBox),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        // TextBox widget displays a text field for the user to enter their password
                        textBox("Password", passwordBox),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          children: [
                            // Link to the sign up page
                            const Text("Haven't any account?"),
                            GestureDetector(
                              onTap: () => Get.to(() => const SingUp()),
                              child: Text(
                                " Register now",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ).paddingOnly(
                        left: Get.width * 0.10,
                        right: Get.width * 0.10,
                        bottom: Get.width * 0.07)),
                (!Platform.isIOS)
                    ? Text(
                        "Sign up with social account",
                        // Text widget displays a message encouraging the user to sign up with their social media account
                        style: GoogleFonts.cabin(
                            fontSize: Get.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff52C3D2)),
                      )
                    : const SizedBox(),
// Row widget displays the icons for Facebook and Google
                (!Platform.isIOS)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              // Call the signInWithFacebook method to sign in with Facebook
                              await authController.signInWithFacebook();
                              // If the user's name is not an empty string, log in with the email and password
                              if (authController.name.value != "") {
                                controller.loginNow(
                                    authController.email.value, "null");
                              }
                            },
                            child: Icon(
                              Icons.facebook_rounded,
                              color: Colors.blue,
                              size: Get.width * 0.10,
                            ).paddingAll(10),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // Call the signInWithGoogle method to sign in with Google
                              await authController.signInWithGoogle();
                              // If the user's name is not an empty string, log in with the email and password
                              if (authController.name.value != "") {
                                controller.loginNow(
                                    authController.email.value, "null");
                              }
                            },
                            child: Image.asset(
                              'assets/google.png',
                              height: Get.width * 0.09,
                              width: Get.width * 0.09,
                            ),
                          ),
                          // SizedBox(
                          //   height: 40,
                          //   width: 60,
                          //   child: SignInWithAppleButton(
                          //     iconAlignment: IconAlignment.center,
                          //     borderRadius: BorderRadius.circular(100),
                          //     style: SignInWithAppleButtonStyle.black,
                          //     text: "",
                          //     onPressed: () async {
                          //       // Sign in with Google and register the user
                          //       await authController.signInwithApple();
                          //       if (authController.name.value != "") {
                          //         controller.loginNow(
                          //             authController.email.value, "null");
                          //       }
                          //     },
                          //   ),
                          // ).paddingAll(10)
                        ],
                      )
                    : const SizedBox(),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    // Validate the form and log in if the form is valid
                    if (formKey.currentState!.validate() == true) {
                      controller.loginNow(emailBox.text, passwordBox.text);
                    }
                  },
                  child: customButton("Login Now"),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () =>
                      Get.to(() => const SideBarView(title: "Privacy Policy")),
                  child: Text(
                    'Privacy Policy',
                    style: GoogleFonts.roboto(
                      color: Colors.blue,
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
          //showing loading widget when user are doing login
          Obx(() =>
              Visibility(visible: controller.isloading.value, child: loading()))
        ],
      ),
    );
  }
}
