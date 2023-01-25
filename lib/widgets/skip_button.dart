import 'package:english_test/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget skip() {
  return GestureDetector(
      onTap: (() async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('islogin', true);
        Get.offAll(() => const Home());
      }),
      child: const Text("Skip"));
}
