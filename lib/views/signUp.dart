import 'package:english_test/controller/register_controller.dart';
import 'package:english_test/views/Login.dart';
import 'package:english_test/views/home.dart';
import 'package:english_test/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/social_auth_controller.dart';
import '../widgets/HeaderText.dart';
import '../widgets/TextBox.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    SocialController authController = Get.put(SocialController());
    RegisterController controller = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameBox = TextEditingController();
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
                  headerText("Sign Up"),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          textBox("Name", nameBox),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textBox("Email", emailBox),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          textBox("Password", passwordBox),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Text("Already a user?"),
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
                      Icon(
                        Icons.facebook_rounded,
                        color: Colors.blue,
                        size: Get.width * 0.10,
                      ).paddingAll(10),
                      GestureDetector(
                        onTap: () async {
                          await authController.signInWithGoogle();

                          var name =
                              FirebaseAuth.instance.currentUser!.displayName;
                          var email = FirebaseAuth.instance.currentUser!.email;
                          Get.snackbar(name!, email!);
                        },
                        child: Image.asset(
                          'assets/google.png',
                          height: Get.width * 0.09,
                          width: Get.width * 0.09,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.width * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate() == true) {
                        controller.registerNow(
                            nameBox.text, emailBox.text, passwordBox.text);
                      }
                    },
                    child: customButton("Register Now"),
                  ),
                ],
              ),
            ),
            Obx(() => Visibility(
                visible: controller.isloading.value,
                child: const CircularProgressIndicator()))
          ],
        ));
  }
}
