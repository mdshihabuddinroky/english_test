//HomeController class with a categories method. The categories method fetches data from a
//server by making two HTTP GET requests, one for "word" categories and another for "sentence" categories.

// The HomeController class has several observable variables: wordcategorylist, sentenceCategorylist, page, isloading_word, and isloading_sentence.
// wordcategorylist and sentenceCategorylist are lists of HomeModel objects that are used to store the data for the "word" and "sentence" categories,
//respectively. page is an integer that is not used in the current code. isloading_word and isloading_sentence are boolean variables that are used to
//track the loading status of the "word" and "sentence" categories, respectively.

// The onInit method is called when the HomeController is initialized. It calls the categories method to fetch the category data.

// The categories method first sets the isloading_word variable to true and calls the fetchCategory method to fetch the "word" categories.
//It then stores the returned data in the wordcategorylist observable list and sets the isloading_word variable to false. Next, it sets the
//isloading_sentence variable to true and calls the fetchCategory method to fetch the "sentence" categories. It then stores the returned data
// in the sentenceCategorylist observable list and sets the isloading_sentence variable to false.

// The fetchCategory method takes a string argument type and uses it to make an HTTP GET request to a server endpoint. If the server responds
//with a status code of 200, the method parses the response body as a list of HomeModel objects and returns it. If the server responds with any
//other status code or if an exception is thrown, the method does not return anything.

// I hope this helps! Let me know if you have any other questions.

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class HomeController extends GetxController {
  // Observable list to store the "word" categories
  var wordcategorylist = <HomeModel>[].obs;
  // Observable list to store the "sentence" categories
  var sentenceCategorylist = <HomeModel>[].obs;

  // Observable integer to store the current page (not used in current code)
  var page = 1.obs;
  // Observable boolean to track loading status of "word" categories
  var isloading_word = true.obs;
  // Observable boolean to track loading status of "sentence" categories
  var isloading_sentence = true.obs;

  // Method called when HomeController is initialized
  @override
  void onInit() {
    categories();
    super.onInit();
  }

  // Method to fetch category data from server
  categories() async {
    // Fetch "word" categories and store in wordcategorylist
    wordcategorylist.value = (await fetchCategory("word"));
    print("lenght is: ${wordcategorylist.length}");
    // Set isloading_word to false to indicate loading is complete
    isloading_word(false);
    // Fetch "sentence" categories and store in sentenceCategorylist
    sentenceCategorylist.value = (await fetchCategory("sentence"));
    // Set isloading_sentence to false to indicate loading is complete
    isloading_sentence(false);
  }

  // Method to fetch a specific category from the server
  Future<List<HomeModel>> fetchCategory(String type) async {
    // Set isloading_word to true to indicate loading is in progress
    if (type == 'word') {
      isloading_word(true);
    } else {
      isloading_sentence(true);
    }

    // Initialize variable to store category data
    var categorylist;
    // Create an HTTP client
    var client = http.Client();
    // Make a GET request to the server with the specified category type
    var response = await client.get(
        Uri.parse('https://faster-english.com/spellapi/get.php?type="$type"'));

    try {
      // If the server responds with a status code of 200
      if (response.statusCode == 200) {
        // Set isloading_word to false to indicate loading is complete

        // Parse the response body as a list of HomeModel objects and store in categorylist
        categorylist = homeModelFromJson(response.body);
      } else {
        // If the server responds with any other status code
        // Get.to(const NoInternet());
      }
    } catch (e) {
      // If an exception is thrown
      // Get.to(const NoInternet());
    }
    // Return the category data
    return categorylist;
  }
}
