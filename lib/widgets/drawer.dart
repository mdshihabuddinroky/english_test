//This is a customDrawer widget that returns a Drawer widget.
//When the user taps on the "Privacy Policy", "Terms & Condition",
//or "About us" ListTile, the app navigates back to the previous screen
//and then to the SideBarView page with the corresponding title. When the user taps on the "Share App" ListTile,
//the app shares a message with a link to download the ICANSPELL app. The Drawer widget has a SafeArea widget as its child,
//which in turn has a Column widget as its child. The Column widget has several ListTile widgets as its children, each with a leading Icon and a title.
//The Column widget also has a padding widget at the top to add some space between the top of the screen and the ListTile widgets.

import 'package:english_test/views/html_view.dart';
import 'package:english_test/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/delete_controller.dart';
import '../views/signUp.dart';

var email;
Future<String> getIslogin() async {
  SharedPreferences prefs = await SharedPreferences
      .getInstance(); // Initialize the shared preferences instance
  email = prefs.getString('islogin');
  return email!;
}

class customDrawer extends StatefulWidget {
  const customDrawer({super.key});

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  Future<void> getPhone() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? Email = prefs.getString('islogin');
    print(Email);

    setState(() => email = Email);
  }

  @override
  Widget build(BuildContext context) {
    DeleteAccountController controller = Get.put(DeleteAccountController());
    getPhone();
    return Obx(() => controller.isloading.value
        ? loading()
        : Drawer(
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
                      Get.to(
                          () => const SideBarView(title: "Terms & Condition"));
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
                          'Download Spellicious app to learn englisn in anew way. Install now from Playstore. https://play.google.com/store/apps/details?id=com.icanspell.app');
                    }),
                    title: Text(
                      "Share App",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                    leading: const Icon(Icons.share),
                  ),
                  ListTile(
// When tapped, share the app information
                    onTap: (() {
                      if (email == "skip") {
                        Get.back();
                        Get.to(() => const SingUp());
                      } else {
                        controller.isloading(true);
                        controller.deleteUser(email);
                      }
                    }),
                    title: Text(
                      (email == "skip") ? "Register Now" : "Delete Account",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                    leading: (email == "skip")
                        ? const Icon(Icons.login_outlined)
                        : const Icon(Icons.logout_outlined),
                  ),
                ],
              ).paddingOnly(top: 20),
            ),
          ));
  }
}
