// ignore_for_file: file_names

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/home.dart';

class LoginController extends GetxController {
  var isloading = false.obs;

  void loginNow(String email, String pass) async {
    final prefs = await SharedPreferences.getInstance();
    isloading(true);

    var client = http.Client();

    var response = await client.get(Uri.parse(
        "https://faster-english.com/spellapi/login.php?email=%22$email%22&pass=%22$pass%22"));

    try {
      if (response.statusCode == 200) {
        prefs.setBool('islogin', true);
        isloading(false);
        Get.offAll(() => const Home());
      } else if (response.statusCode == 403) {
        isloading(false);
        Get.snackbar("Failed", "Email or password is wrong");
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
