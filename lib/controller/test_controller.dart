// ignore_for_file: file_names

import 'package:english_test/model/test_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class TestController extends GetxController {
  var testlist = <TestModel>[].obs;
  final category;
  var page = 1.obs;
  var isloading = true.obs;
  var pageindex = 0.obs;
  var buttoncolor = {}.obs;

  TestController(this.category);
  @override
  void onInit() {
    fetchProducts(category);
    super.onInit();
  }

  fetchProducts(String category) async {
    isloading(true);

    var client = http.Client();

    var response = await client.get(Uri.parse(
        "https://faster-english.com/spellapi/gettest.php?category=%27$category%27"));

    try {
      if (response.statusCode == 200) {
        isloading(false);
        var testList = testModelFromJson(response.body);

        testlist.clear();
        testlist.value = testList;
      } else {
        //  Get.to(const NoInternet());
      }
    } catch (e) {
      //Get.to(const NoInternet());
    }
  }
}
