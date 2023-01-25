import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton(String text) {
  return Material(
    borderRadius: BorderRadius.circular(10),
    elevation: 5,
    shadowColor: Colors.redAccent,
    child: Container(
        width: Get.width * 0.70,
        decoration: BoxDecoration(
            color: const Color(0xff003eff),
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        height: Get.height * 0.06,
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: Get.height * 0.020),
        )),
  );
}
