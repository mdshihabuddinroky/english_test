import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// This widget creates a container with a text element inside it, displaying the provided 'text' parameter
// It has a fixed height that is 30% of the screen height and is centered horizontally
// The text element has a large font size and is styled using the Google Fonts 'Cabin' font with bold weight
// The text color is set to a constant color value
Widget headerText(String text) {
  return Container(
    height: Get.height * 0.30, // Set the height to be 30% of the screen height
    alignment: Alignment.center, // Center the text horizontally
    width: Get.width, // Set the width to be the full width of the screen
    child: Text(
      text, // Display the provided 'text' parameter
      style: GoogleFonts.cabin(
          fontSize: Get.width *
              0.15, // Set the font size to be 15% of the screen width
          fontWeight: FontWeight.bold, // Set the font weight to bold
          color: const Color(
              0xff52C3D2)), // Set the text color to a constant color value
    ),
  );
}
