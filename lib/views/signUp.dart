// This is a Flutter app that defines a SingUp widget. The SingUp widget is a form that allows users to sign up for an account by entering their name, email, and password. The widget also has buttons that allow users to sign up using their Facebook or Google account.

// The SingUp widget has several variables: an authController of type SocialController, a controller of type RegisterController, a _formKey of type GlobalKey<FormState>, and three TextEditingController objects: nameBox, emailBox, and passwordBox.

// The build method of the SingUp widget displays a Scaffold with a column of children. The first child is a stack that includes a headerText widget and a skip widget. The second child is a Form widget that includes three textBox widgets and a row of text with a gesture detector that navigates to the Login view when tapped. The third child is a row of gesture detectors that allow the user to sign up with their Facebook or Google account. The fourth child is a progressLoadingButton widget that, when pressed, validates the form and calls the registerNow method of the RegisterController to register the user.

// The progressLoadingButton widget has an onPressed callback that calls the validate method of the _formKey object and, if the form is valid, calls the registerNow method of the controller and passes it the name, email, and password as arguments. If the registerNow method returns successfully, the widget navigates to the Home view.

import 'package:english_test/controller/register_controller.dart';
import 'package:english_test/views/Login.dart';

import 'package:english_test/widgets/customButton.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../controller/social_auth_controller.dart';
import '../widgets/HeaderText.dart';
import '../widgets/TextBox.dart';
import '../widgets/loading.dart';
import '../widgets/skip_button.dart';
import 'html_view.dart';

// This is a StatelessWidget that defines a form for signing up for an account. It allows users to enter their name, email, and password, and provides buttons for signing up with a social media account or navigating to the login screen.
class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create instances of the SocialController and RegisterController classes
    SocialController authController = Get.put(SocialController());
    RegisterController controller = Get.put(RegisterController());
    // Create a GlobalKey for the form
    final _formKey = GlobalKey<FormState>();
    // Create TextEditingController objects for the name, email, and password fields
    TextEditingController nameBox = TextEditingController();
    TextEditingController emailBox = TextEditingController();
    TextEditingController passwordBox = TextEditingController();
    return Scaffold(
        backgroundColor: const Color(0xffF9FAFE),
        body: Stack(
          alignment: Alignment.center,
          children: [
            // SingleChildScrollView allows the user to scroll through the form if the screen is not tall enough to display all elements
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Stack widget allows elements to overlap
                  Stack(
                    children: [
                      // HeaderText widget displays the text "Sign Up"
                      headerText("Sign Up"),
                      // Positioned widget positions the skip button on the top right corner of the screen
                      Positioned(right: 20, top: 50, child: skip())
                    ],
                  ),
                  // Form widget allows for validation of the form
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // textBox widget displays a text field for the user to enter their name
                          textBox("Name", nameBox),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          // textBox widget displays a text field for the user to enter their email
                          textBox("Email", emailBox),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          // textBox widget displays a text field for the user to enter their password
                          textBox("Password", passwordBox),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          // Row widget displays a row of text and a clickable text to go to login
                          // screen if user already registered

                          Row(
                            children: [
                              const Text("Already a user?"),
                              GestureDetector(
                                onTap: () => Get.to(() => const Login()),
                                child: Text(
                                  " Login",
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
                  Text(
                    "Sign up with social account",
                    style: GoogleFonts.cabin(
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff52C3D2)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Facebook sign-in button
                      GestureDetector(
                        onTap: () async {
                          // Sign in with Facebook and register the user
                          await authController.signInWithFacebook();
                          if (authController.name.value != "") {
                            controller.registerNow(authController.name.value,
                                authController.email.value, "null");
                          }
                        },
                        child: Icon(
                          Icons.facebook_rounded,
                          color: Colors.blue,
                          size: Get.width * 0.10,
                        ).paddingAll(10),
                      ),
                      // Google sign-in button
                      GestureDetector(
                        onTap: () async {
                          // Sign in with Google and register the user
                          await authController.signInWithGoogle();
                          if (authController.name.value != "") {
                            controller.registerNow(authController.name.value,
                                authController.email.value, "null");
                          }
                        },
                        child: Image.asset(
                          'assets/google.png',
                          height: Get.width * 0.09,
                          width: Get.width * 0.09,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 60,
                        child: SignInWithAppleButton(
                          iconAlignment: IconAlignment.center,
                          borderRadius: BorderRadius.circular(100),
                          style: SignInWithAppleButtonStyle.black,
                          text: "",
                          onPressed: () async {
                            // Sign in with Google and register the user
                            await authController.signInwithApple();
                            if (authController.name.value != "") {
                              controller.registerNow(authController.name.value,
                                  authController.email.value, "null");
                            }
                          },
                        ),
                      ).paddingAll(10)
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  // Register button
                  GestureDetector(
                    onTap: () {
                      // Validate form and register user
                      if (_formKey.currentState!.validate() == true) {
                        controller.registerNow(
                            nameBox.text, emailBox.text, passwordBox.text);
                      }
                    },
                    child: customButton("Register Now"),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(
                        () => const SideBarView(title: "Privacy Policy")),
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
            Obx(() => Visibility(
                // Show loading indicator when isloading is true
                visible: controller.isloading.value,
                child: loading()))
          ],
        ));
  }
}
