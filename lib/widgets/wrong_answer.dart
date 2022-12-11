import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void wrongAnswer(String answer) {
  Get.defaultDialog(
      title: "Wrong Answer",
      titleStyle: GoogleFonts.roboto(fontSize: 25),
      textCancel: "Ok",
      content: Column(
        children: [
          SizedBox(
            height: Get.height * 0.30,
            child: Lottie.asset("assets/wrong.json", fit: BoxFit.cover),
          ).paddingAll(2),
          Text(
            "Correct Answer: ${answer.toString()}",
            style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            "Try Again",
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ],
      ));
}
