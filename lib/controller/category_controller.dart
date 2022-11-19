// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class HomeController extends GetxController {
  var wordcategorylist = <HomeModel>[].obs;
  var sentenceCategorylist = <HomeModel>[].obs;

  var page = 1.obs;
  var isloading_word = true.obs;
  var isloading_sentence = true.obs;

  @override
  void onInit() {
    categories();
    super.onInit();
  }

  categories() async {
    wordcategorylist.value = (await fetchCategory("word")) as List<HomeModel>;
    isloading_word(false);
    sentenceCategorylist.value =
        (await fetchCategory("sentence")) as List<HomeModel>;
    isloading_sentence(false);
  }

  fetchCategory(String type) async {
    isloading_word(true);
    var categorylist;
    var client = http.Client();

    var response = await client.get(
        Uri.parse('https://faster-english.com/spellapi/get.php?type="$type"'));

    try {
      if (response.statusCode == 200) {
        isloading_word(false);
        categorylist = homeModelFromJson(response.body);
      } else {
        //  Get.to(const NoInternet());
      }
    } catch (e) {
      //Get.to(const NoInternet());
    }
    return categorylist;
  }
}
