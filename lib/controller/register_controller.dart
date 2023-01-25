// ignore_for_file: file_names

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/home.dart';

class RegisterController extends GetxController {
  var isloading = false.obs;

  void registerNow(String name, String email, String pass) async {
    isloading(true);
    final prefs = await SharedPreferences.getInstance();
    //islogin = prefs.getBool("islogin") ?? false;
    var client = http.Client();

    var response = await client.get(Uri.parse(
        "https://faster-english.com/spellapi/register.php?name=%22$name%22&email=%22$email%22&pass=%22$pass%22"));

    try {
      if (response.statusCode == 200) {
        isloading(false);
        Get.offAll(() => const Home());
        prefs.setBool('islogin', true);
      } else if (response.statusCode == 403) {
        isloading(false);
        Get.snackbar("Failed", "This email is already registered");
      } else {
        //  Get.to(const NoInternet());
        isloading(false);
        Get.snackbar("Failed", "Something went wrong!");
      }
    } catch (e) {
      //Get.to(const NoInternet());
    }
  }
}
