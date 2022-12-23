import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget noData() {
  return Center(
    child: Text(
      "No data found",
      style: GoogleFonts.poppins(fontSize: 20),
    ),
  );
}
