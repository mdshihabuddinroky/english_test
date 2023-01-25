import 'package:flutter/material.dart'; // Import the Material library
import 'package:get/get.dart'; // Import the Get library for routing
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts library
import 'package:lottie/lottie.dart'; // Import the Lottie library for animation

// Define the 'wrongAnswer' function, which takes in a single string parameter 'answer'
void wrongAnswer(String answer) {
  // Show a default dialog using the Get library
  Get.defaultDialog(
      // Set the title of the dialog to be "Wrong Answer" and style it with the Roboto font and a font size of 25
      title: "Wrong Answer",
      titleStyle: GoogleFonts.roboto(fontSize: 25),
      // Set the label of the cancel button to be "Ok"
      textCancel: "Ok",
      // The content of the dialog is a Column widget containing several other widgets
      content: Column(
        children: [
          // The first widget is a SizedBox widget that displays a Lottie animation
          SizedBox(
            // Set the height of the SizedBox to be 30% of the screen height
            height: Get.height * 0.30,
            // Set the child of the SizedBox to be a Lottie animation with the file path "assets/wrong.json"
            child: Lottie.asset("assets/wrong.json", fit: BoxFit.cover),
          ).paddingAll(2), // Add padding to the SizedBox
          // The second widget is a Text widget displaying the correct answer
          Text(
            // Display the correct answer passed to the 'wrongAnswer' function
            "Correct Answer: ${answer.toString()}",
            // Set the style of the text with the Roboto font, a font size of 25, a bold font weight, and a blue color
            style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          // The third widget is a SizedBox widget used to add space between the previous widget and the next widget
          SizedBox(
            height: Get.height * 0.01,
          ),
          // The fourth widget is a Text widget displaying the message "Try Again"
          Text(
            "Try Again",
            // Set the style of the text with the Roboto font and a font size of 20
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ],
      ));
}
