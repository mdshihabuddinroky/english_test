import 'package:english_test/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/signUp.dart';

var islogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  // OneSignal.shared.setAppId("6f78c550-4d62-4ec4-b023-9aa9d2301298");
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var email = prefs.getBool('islogin');
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      theme: ThemeData(primaryColor: const Color(0xff003eff)),
      home: email == null ? const SingUp() : const Home()
      // home: const SingUp()
      ));
}
