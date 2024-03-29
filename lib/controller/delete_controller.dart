// ignore_for_file: file_names
/*
// This code appears to be part of a Flutter app that defines a SearchController class with a fetchProducts method. The fetchProducts method takes a string argument querry and uses it to make an HTTP GET request to a server endpoint with a query string that includes the querry variable.

// The SearchController class has several observable variables: searchlist, page, isloading, and pageindex. searchlist is a list of TestModel objects that is used to store the data for the search results. page and pageindex are integers that are not used in the current code. isloading is a boolean variable that is used to track the loading status of the fetchProducts method.

// If the server responds with a status code of 200, the method sets the isloading variable to false, parses the response body as a list of TestModel objects, and stores the list in the searchlist observable list. If the server responds with any other status code or if an exception is thrown, the method does not do anything.
*/
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../views/signUp.dart';

class DeleteAccountController extends GetxController {
  var isloading = false.obs;

// method to fetch search results from server
  deleteUser(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// set loading status to true
    isloading(true);
    print("hello:$email");

// create an HTTP client
    var client = http.Client();

// make a GET request to the server with the search query in the URL
    var response = await client.get(Uri.parse(
        "https://www.faster-english.com/spellapi/delete.php?email=%22$email%22"));
    print("Satus code: ${response.statusCode}");
    print("body: ${response.body}");
    try {
      if (response.statusCode == 200) {
        isloading(false);
        prefs.clear();
        Get.offAll(() => const SingUp());
      } else {
        //  Get.to(const NoInternet());
      }
    } catch (e) {
      //Get.to(const NoInternet());
    }
  }
}
