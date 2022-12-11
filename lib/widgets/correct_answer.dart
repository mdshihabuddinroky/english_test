import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void correctAnswer() {
  Get.defaultDialog(
      title: "Correct Answer",
      titleStyle: GoogleFonts.roboto(fontSize: 25),
      textCancel: "Ok",
      content: SizedBox(
        height: Get.height * 0.30,
        child: Lottie.asset("assets/correct.json"),
      ));
}
