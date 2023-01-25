import 'package:english_test/views/HomeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the Get library for routing
import 'package:shared_preferences/shared_preferences.dart'; // Import the shared preferences package for storing data on the device

// Define a function named 'skip' that returns a widget
Widget skip() {
  return GestureDetector(
// Wrap the widget in a GestureDetector to detect taps
      onTap: (() async {
// When the widget is tapped, execute the following code:
        final prefs = await SharedPreferences
            .getInstance(); // Get the shared preferences instance
        prefs.setBool('islogin',
            true); // Set the value of 'islogin' to 'true' in the shared preferences
        Get.offAll(() =>
            const Home()); // Use the Get library to navigate to the home page, dismissing all previous routes
      }),
      child: const Text(
          "Skip")); // The widget displayed is a Text widget with the text "Skip"
}
