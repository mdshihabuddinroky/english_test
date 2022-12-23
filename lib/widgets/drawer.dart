import 'package:english_test/views/html_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

Widget customDrawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.010,
          ),
          ListTile(
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
          ListTile(
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
          ListTile(
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
          ListTile(
            onTap: (() {
              Get.back();
              Share.share(
                  'Download ICANSPELL app to learn englisn in anew way. Install now from Playstore. ');
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
