// ignore_for_file: file_names

import 'package:english_test/model/test_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  var searchlist = <TestModel>[].obs;

  var page = 1.obs;
  var isloading = false.obs;
  var pageindex = 0.obs;

  fetchProducts(String querry) async {
    isloading(true);

    var client = http.Client();

    var response = await client.get(Uri.parse(
        "https://faster-english.com/spellapi/search.php?search=%27$querry%27"));

    try {
      if (response.statusCode == 200) {
        isloading(false);
        var testList = testModelFromJson(response.body);

        searchlist.clear();
        searchlist.value = testList;
      } else {
        //  Get.to(const NoInternet());
      }
    } catch (e) {
      //Get.to(const NoInternet());
    }
  }
}
