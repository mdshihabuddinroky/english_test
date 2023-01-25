import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/testScreen/test.dart';

// Define a categoryListWidget that takes in a name and an icon and returns a ListTile widget
Widget categoryListWidget(String name, String icon) {
// Return a Padding widget with a ListTile widget inside
  return Padding(
// Set the padding to only the top
    padding: EdgeInsets.only(
      top: Get.height * 0.03,
//left: 10,
//right: 10
    ),
    child: ListTile(
// When tapped, navigate to the TestScreen view with the category name passed in
        onTap: (() {
          Get.to(() => TestScreen(
                category: name,
              ));
        }),
// Set the leading widget to a CachedNetworkImage widget with the icon passed in
        leading: CachedNetworkImage(
          imageUrl: icon,
          width: 100,
          fit: BoxFit.fill,
// Set the placeholder widget to a Container with a loading spinner
          placeholder: (context, url) => Container(
            color: const Color(0xffbaedfc),
            width: 100,
            height: 60,
          ),
// Set the error widget to an Icon
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
// Set the title to the name passed in, styled with the GoogleFonts.poppins font
        title: Text(
          name,
          style: GoogleFonts.poppins(fontSize: 20),
        )),
  );
}
