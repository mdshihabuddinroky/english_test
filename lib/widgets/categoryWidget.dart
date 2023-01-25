import 'package:cached_network_image/cached_network_image.dart';
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
        leading: CachedNetworkImage(
          imageUrl: icon,
          width: 100,
          fit: BoxFit.fill,
          placeholder: (context, url) => Container(
            color: const Color(0xffbaedfc),
            width: 100,
            height: 60,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          name,
          style: GoogleFonts.poppins(fontSize: 20),
        )),
  );
}
