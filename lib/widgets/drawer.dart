//This is a customDrawer widget that returns a Drawer widget.
//When the user taps on the "Privacy Policy", "Terms & Condition",
//or "About us" ListTile, the app navigates back to the previous screen
//and then to the SideBarView page with the corresponding title. When the user taps on the "Share App" ListTile,
//the app shares a message with a link to download the ICANSPELL app. The Drawer widget has a SafeArea widget as its child,
//which in turn has a Column widget as its child. The Column widget has several ListTile widgets as its children, each with a leading Icon and a title.
//The Column widget also has a padding widget at the top to add some space between the top of the screen and the ListTile widgets.

import 'package:english_test/views/html_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

// Define a customDrawer widget that returns a Drawer widget
Widget customDrawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
// Add a padding widget at the top of the Column
          SizedBox(
            height: Get.height * 0.010,
          ),
// Add a ListTile widget with a leading Icon and a title "Privacy Policy"
          ListTile(
// When tapped, navigate back and then to the SideBarView page with the title "Privacy Policy"
            onTap: (() {
              Get.back();
              Get.to(() => const SideBarView(title: "Privacy Policy"));
            }),
            title: Text(
              "Privacy Policy",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            leading: const Icon(Icons.security_outlined),
          ),
// Add a ListTile widget with a leading Icon and a title "Terms & Condition"
          ListTile(
// When tapped, navigate back and then to the SideBarView page with the title "Terms & Condition"
            onTap: (() {
              Get.back();
              Get.to(() => const SideBarView(title: "Terms & Condition"));
            }),
            title: Text(
              "Terms & Condition",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            leading: const Icon(Icons.notes_sharp),
          ),
// Add a ListTile widget with a leading Icon and a title "About us"
          ListTile(
// When tapped, navigate back and then to the SideBarView page with the title "About us"
            onTap: (() {
              Get.back();
              Get.to(() => const SideBarView(title: "About us"));
            }),
            title: Text(
              "About us",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            leading: const Icon(Icons.info_outline),
          ),
// Add a ListTile widget with a leading Icon and a title "Share App"
          ListTile(
// When tapped, share the app information
            onTap: (() {
              Get.back();
              Share.share(
                  'Download ICANSPELL app to learn englisn in anew way. Install now from Playstore. https://play.google.com/store/apps/details?id=com.icanspell.app');
            }),
            title: Text(
              "Share App",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            leading: const Icon(Icons.share),
          ),
        ],
      ).paddingOnly(top: 20),
    ),
  );
}
