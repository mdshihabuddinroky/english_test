import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// Define a correctAnswer function that displays a dialog with a Lottie animation and a "Ok" button
void correctAnswer() {
// Use Get's defaultDialog function to display a dialog
  Get.defaultDialog(
// Set the title and title style
    title: "Correct Answer",
    titleStyle: GoogleFonts.roboto(fontSize: 25),
// Set the text of the cancel button to "Ok"
    textCancel: "Ok",
// Set the content to a SizedBox widget with a height of 30% of the screen height and a Lottie animation
    content: SizedBox(
      height: Get.height * 0.30,
      child: Lottie.asset("assets/correct.json"),
    ),
  );
}
