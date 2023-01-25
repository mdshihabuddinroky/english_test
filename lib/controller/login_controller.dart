// LoginController class with a loginNow method. The loginNow method takes two strings as arguments, email and pass, which represent the email and password of the user trying to log in.

// The method first initializes a SharedPreferences object and sets the isloading observable variable to true. It then creates an HTTP client and uses it to send a GET request to a login
//endpoint with the email and pass arguments in the query string.

// If the server responds with a status code of 200, the method sets a flag in the SharedPreferences object indicating that the user is logged in and navigates to the Home view. If the server
//responds with a status code of 403, the method displays a snackbar with the message "Email or password is wrong". If the server responds with any other status code or if an exception is thrown,
//the method displays a snackbar with the message "Something went wrong!". Finally, the method sets the isloading observable variable to false in all cases.
// import necessary libraries
import 'package:get/get.dart';
// ignore_for_file: avoid_print

import 'package:bcrypt/bcrypt.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import the Home view
import '../Services/encrypt.dart';
import '../views/HomeScreen/home.dart';

// define the LoginController class
class LoginController extends GetxController {
  // define an observable variable for loading status
  var isloading = false.obs;

  // define the loginNow method
  void loginNow(String email, String pass) async {
    // initialize the SharedPreferences object
    final prefs = await SharedPreferences.getInstance();
    // set the isloading variable to true
    isloading(true);

    // create an HTTP client
    var client = http.Client();
    var password = encryptDecrypt(pass, 5);
    // send a GET request to the login endpoint with email and pass in the query string
    var response = await client.get(Uri.parse(
        "https://faster-english.com/spellapi/login.php?email=%22$email%22&pass=%22$password%22"));

    try {
      // if the server responds with a status code of 200
      if (response.statusCode == 200) {
        // set the islogin flag in SharedPreferences to true
        prefs.setBool('islogin', true);
        // set the isloading variable to false
        isloading(false);
        // navigate to the Home view
        Get.offAll(() => const Home());
      }
      // if the server responds with a status code of 403
      else if (response.statusCode == 403) {
        // set the isloading variable to false
        isloading(false);
        // display a snackbar with the message "Email or password is wrong"
        Get.snackbar("Failed", "Email or password is wrong");
      }
      // if the server responds with any other status code
      else {
        // set the isloading variable to false
        isloading(false);
        // display a snackbar with the message "Something went wrong!"
        Get.snackbar("Failed", "Something went wrong!");
      }
    }
    // if an exception is thrown
    catch (e) {
      // set the isloading variable to false
      isloading(false);
      // display a snackbar with the message "Something went wrong!"
      Get.snackbar("Failed", "Something went wrong!");
    }
  }
}
