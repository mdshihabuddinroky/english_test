import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../views/home.dart';

void result(String length, String result) {
  Get.defaultDialog(
      title: "Your Result",
      titleStyle: GoogleFonts.roboto(fontSize: 25),
      content: SizedBox(
        height: Get.height * 0.55,
        width: Get.width * 0.80,
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(
                  "/$result$length",
                  style: GoogleFonts.ptSans(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Lottie.asset(fit: BoxFit.cover, "assets/congrats.json"),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Home());
                  },
                  child: Container(
                      width: Get.width * 0.70,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      height: Get.height * 0.05,
                      child: Text(
                        "Go to home",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: Get.height * 0.020),
                      )),
                ),
              ],
            ),
          ),
        ),
      ));
}
