import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Widget to display a message when no data is found
Widget noData() {
  return Center(
    child: Text(
      "No data found", // Display message to the user
      style: GoogleFonts.poppins(
          fontSize: 20), // Set the font style of the message
    ),
  );
}
