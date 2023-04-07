import 'package:audioplayers/audioplayers.dart';
import 'package:english_test/views/HomeScreen/home.dart'; // Import the home page view
import 'package:firebase_core/firebase_core.dart'; // Import the Firebase core library
import 'package:flutter/material.dart'; // Import the Material library for pre-built UI widgets
import 'package:get/get.dart'; // Import the Get library for routing
//import 'package:onesignal_flutter/onesignal_flutter.dart'; // Import the OneSignal library for push notifications
import 'package:shared_preferences/shared_preferences.dart'; // Import the shared_preferences library for storing data locally
import 'views/signUp.dart'; // Import the sign up page view

var islogin = false; // Declare a variable to store the login status
//This code initializes the Flutter binding, the Firebase app, and the OneSignal library.
//It then retrieves the login status from the shared preferences and sets the home page to be either the sign up page or the home page based on the login status.
//Finally, it runs the GetMaterialApp widget, which is a Material app with routing functionality provided by the Get library.
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize the Flutter binding
//audio player
  // final AudioContext audioContext = AudioContext(
  //   iOS: AudioContextIOS(
  //     category: AVAudioSessionCategory.ambient,
  //     options: [
  //       AVAudioSessionOptions.defaultToSpeaker,
  //       AVAudioSessionOptions.mixWithOthers,
  //     ],
  //   ),
  //   android: AudioContextAndroid(
  //     isSpeakerphoneOn: true,
  //     stayAwake: true,
  //     contentType: AndroidContentType.sonification,
  //     usageType: AndroidUsageType.assistanceSonification,
  //     audioFocus: AndroidAudioFocus.none,
  //   ),
  // );
  // AudioPlayer.global.setGlobalAudioContext(audioContext);
  //audio

  await Firebase.initializeApp(); // Initialize the Firebase app
//await FirebaseAuth.instance.useAuthEmulator('localhost', 9099); // (Optional) Connect to the Firebase emulator
  // OneSignal.shared.setLogLevel(
  //     OSLogLevel.verbose, OSLogLevel.none); // Set the log level for OneSignal
  // OneSignal.shared
  //     .setAppId("ae266013-375e-4881-a448-0212a5ed0d1d"); // Set onesignal app id
  SharedPreferences prefs = await SharedPreferences
      .getInstance(); // Initialize the shared preferences instance

  var email = prefs
      .getString('islogin'); // Get the login status from the shared preferences
// If the login status is null, show the sign up page; otherwise, show the home page
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      defaultTransition:
          Transition.zoom, // Set the default transition animation to be a zoom
      theme: ThemeData(
          primaryColor: const Color(
              0xff003eff)), // Set the primary color of the theme to be a deep blue
      home: email == null
          ? const SingUp()
          : const Home() // Set the home page to be either the sign up page or the home page
      ));
}
