import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../views/HomeScreen/home.dart';

// Define a function named 'result' that takes in two string parameters 'length' and 'result'
void result(String length, String result) {
  Get.defaultDialog(
// Display a default dialog using the Get library
      title: "Your Result", // Set the title of the dialog
      titleStyle:
          GoogleFonts.roboto(fontSize: 25), // Set the style of the title
      content: SizedBox(
        height: Get.height *
            0.55, // Set the height of the SizedBox to be 55% of the screen height
        width: Get.width *
            0.80, // Set the width of the SizedBox to be 80% of the screen width
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
// The content of the dialog is a Column widget containing several other widgets
                Text(
                  "$result/$length", // Display the result and the length of the test
                  style: GoogleFonts.ptSans(
                      fontSize: 40,
                      fontWeight: FontWeight.bold), // Set the style of the text
                ),
                Lottie.asset(
                  fit: BoxFit
                      .cover, // Fit the Lottie animation to the size of the container
                  "assets/congrats.json", // Display a Lottie animation with the file path "assets/congrats.json"
                ),
                SizedBox(
                  height: Get.height *
                      0.02, // Set the height of the SizedBox to be 2% of the screen height
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() =>
                        const Home()); // Navigate to the Home page when the container is tapped
                  },
                  child: Container(
                      width: Get.width *
                          0.70, // Set the width of the container to be 70% of the screen width
                      decoration: BoxDecoration(
                        color:
                            Colors.redAccent, // Set the color of the container
                        borderRadius: BorderRadius.circular(
                            10), // Set the border radius of the container to be 10 pixels
                      ),
                      alignment: Alignment
                          .center, // Align the content of the container to be centered
                      height: Get.height *
                          0.05, // Set the height of the container to be 5% of the screen height
                      child: Text(
                        "Home", // Display the label "Home"
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: Get.height *
                                0.020), // Set the style of the text
                      )),
                ),
              ],
            ),
          ),
        ),
      ));
}
