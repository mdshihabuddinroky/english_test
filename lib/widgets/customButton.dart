import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Define a customButton widget that returns a Material widget
Widget customButton(String text) {
  return Material(
// Add a border radius and an elevation to the Material widget
    borderRadius: BorderRadius.circular(10),
    elevation: 5,
    shadowColor: Colors.redAccent,
    child: Container(
// Set the width and height of the Container widget to a certain percentage of the screen size
        width: Get.width * 0.70,
        decoration: BoxDecoration(
            color: const Color(0xff003eff),
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        height: Get.height * 0.06,
// Add a Text widget with the text passed to the function as an argument and styling defined in the GoogleFonts package
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: Get.height * 0.020),
        )),
  );
}
