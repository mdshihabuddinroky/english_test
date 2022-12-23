import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget headerText(String text) {
  return Container(
    height: Get.height * 0.30,
    alignment: Alignment.center,
    width: Get.width,
    child: Text(
      text,
      style: GoogleFonts.cabin(
          fontSize: Get.width * 0.15,
          fontWeight: FontWeight.bold,
          color: const Color(0xff52C3D2)),
    ),
  );
}
