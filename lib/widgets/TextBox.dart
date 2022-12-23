import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textBox(String name, TextEditingController controller) {
  return Material(
    borderRadius: BorderRadius.circular(10),
    elevation: 5.0,
    shadowColor: Colors.blue,
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter $name";
        } else {
          null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
          errorStyle: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold, color: Colors.redAccent),
          labelStyle: GoogleFonts.josefinSans(fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          hintText: name,
          hintStyle: GoogleFonts.josefinSans(fontWeight: FontWeight.bold)),
    ),
  );
}
