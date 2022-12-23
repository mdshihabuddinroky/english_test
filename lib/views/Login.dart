import 'package:english_test/controller/login_controller.dart';
import 'package:english_test/views/signUp.dart';
import 'package:english_test/widgets/TextBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/HeaderText.dart';
import '../widgets/customButton.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    final _formKey = GlobalKey<FormState>();
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
                headerText("Sign In"),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                    Image.asset(
                      'assets/google.png',
                      height: Get.width * 0.09,
                      width: Get.width * 0.09,
                    )
                  ],
                ),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate() == true) {
                      controller.registerNow(emailBox.text, passwordBox.text);
                    }
                  },
                  child: customButton("Login Now"),
                ),
              ],
            ),
          ),
          Obx(() => Visibility(
              visible: controller.isloading.value,
              child: const CircularProgressIndicator()))
        ],
      ),
    );
  }
}
