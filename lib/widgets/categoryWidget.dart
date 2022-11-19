import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/test.dart';

Widget categoryListWidget(String name, String icon) {
  return Padding(
    padding: EdgeInsets.only(
      top: Get.height * 0.03,
      //left: 10,
      //right: 10
    ),
    child: ListTile(
        onTap: (() {
          Get.to(() => TestScreen(
                category: name,
              ));
        }),
        leading: Image.network(icon),
        title: Text(
          name,
          style: GoogleFonts.poppins(fontSize: 20),
        )),
  );
}
