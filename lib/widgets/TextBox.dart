// ignore_for_file: file_names

import 'package:flutter/material.dart';
// Import the Get library for routing
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts library

// Define a widget named 'textBox' that takes in two parameters: a string 'name' and a TextEditingController 'controller'
Widget textBox(String name, TextEditingController controller) {
  return Material(
    borderRadius:
        BorderRadius.circular(10), // Set the border radius to 10 pixels
    elevation: 5.0, // Set the elevation to 5
    shadowColor: Colors.blue, // Set the shadow color to blue
    child: TextFormField(
      validator: (value) {
// Define a validator function for the TextFormField
        if (value!.isEmpty) {
          // If the value is empty
          return "Please enter $name"; // Return an error message
        } else {
          null; // Otherwise, return null
        }
      },
      controller:
          controller, // Set the controller of the TextFormField to the given controller
      decoration: InputDecoration(
          errorStyle: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent), // Set the style of the error text
          labelStyle: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold), // Set the style of the label text
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Set the border radius to 10 pixels
            borderSide: const BorderSide(
              color: Colors.white, // Set the border color to white
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Set the border radius to 10 pixels
            borderSide: const BorderSide(
              color: Colors.white, // Set the border color to white
              width: 2.0, // Set the border width to 2 pixels
            ),
          ),
          hintText: name, // Set the hint text to the given 'name'
          hintStyle: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold)), // Set the style of the hint text
    ),
  );
}
