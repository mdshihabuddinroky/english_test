// ignore_for_file: file_names
/* 
RegisterController class with a registerNow method. The registerNow method takes three string arguments: name, email, and pass. It uses these arguments to make an HTTP GET request to a server endpoint with a query string that includes the name, email, and pass variables.

The RegisterController class has an observable variable called isloading. isloading is a boolean variable that is used to track the loading status of the registerNow method.

If the server responds with a status code of 200, the method sets the isloading variable to false, navigates to the Home view, and sets the islogin variable in the device's shared preferences to true. If the server responds with a status code of 403, the method sets the isloading variable to false and displays a snackbar with a "Failed" message and the text "This email is already registered". If the server responds with any other status code or if an exception is thrown, the method sets the isloading variable to false and displays a snackbar with a "Failed" message and the text "Something went wrong!".
*/
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/encrypt.dart';
import '../views/HomeScreen/home.dart';

// This class represents a controller for registering a new user.
class RegisterController extends GetxController {
  // Observable variable to track the loading status of the register method.
  var isloading = false.obs;

  // Method to register a new user with the given name, email, and password.
  void registerNow(String name, String email, String pass) async {
    // Set isloading to true to indicate that the registration process is in progress.
    isloading(true);
    var password = encryptDecrypt(pass, 5);
    // Get an instance of SharedPreferences to store login status.
    final prefs = await SharedPreferences.getInstance();
    // Create an HTTP client.
    var client = http.Client();
    // Make a GET request to the server with the given name, email, and password as query parameters.
    var response = await client.get(Uri.parse(
        "https://faster-english.com/spellapi/register.php?name=%22$name%22&email=%22$email%22&pass=%22$password%22"));

    // Try to handle the server response.
    try {
      // If the server responds with a status code of 200, set isloading to false, navigate to the Home view, and set the islogin variable in shared preferences to true.
      if (response.statusCode == 200) {
        isloading(false);
        Get.offAll(() => const Home());
        prefs.setBool('islogin', true);
        // If the server responds with a status code of 403, set isloading to false and show a snackbar with a "Failed" message and the text "This email is already registered".
      } else if (response.statusCode == 403) {
        isloading(false);
        Get.snackbar("Failed", "This email is already registered");
        // If the server responds with any other status code or if an exception is thrown, set isloading to false and show a snackbar with a "Failed" message and the text "Something went wrong!".
      } else {
        isloading(false);
        Get.snackbar("Failed", "Something went wrong!");
      }
    } catch (e) {
      // Catch any exceptions and do nothing.
    }
  }
}
