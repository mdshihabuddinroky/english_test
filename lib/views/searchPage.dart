import 'package:english_test/views/testScreen/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/searchController.dart';
import '../widgets/no_data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController for the search field
    final TextEditingController txtcontroller = TextEditingController();
    // Create a SearchController and register it in the dependency injection system
    final SearchControllers controller = Get.put(SearchControllers());

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: SizedBox(
              height: Get.height * 0.06,
              child: TextField(
                // Call fetchProducts on the controller with the search field value after a delay of 500 milliseconds
                onChanged: ((value) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    controller.fetchProducts(value);
                  });
                }),
                // Use the TextEditingController for the search field
                controller: txtcontroller,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xfff4f4fa),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    height: 1,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 210, 203, 203), width: 1.0),
                  ),
                ),
              ),
            )),
        body: Obx(() =>
            // If the search is still loading, display a loading spinner
            (controller.isloading.value)
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                // If the search is finished and there is no search text, display a message
                : (controller.isloading.value == false &&
                        controller.searchlist.isEmpty &&
                        txtcontroller.text.isEmpty)
                    ? Center(
                        child: Text(
                          "Enter a search term to see results",
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                      )
                    // If the search is finished and there are no results, display a "No data" message
                    : (controller.isloading.value == false &&
                            controller.searchlist.isEmpty)
                        ? noData()
                        // If the search is finished and there are results, display the results in a list
                        : ListView.builder(
                            itemCount: controller.searchlist.length,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                // Navigate to the TestScreen when an item is tapped with the item
                                onTap: (() => Get.to(() => TestScreen(
                                      category: controller
                                          .searchlist[index].category
                                          .toString(),
                                    ))),
                                //search icon
                                leading: const Icon(Icons.search),
                                //search result item
                                title: Text(
                                  controller.searchlist[index].category
                                      .toString(),
                                ),
                                //icon
                                trailing: const Icon(
                                    Icons.subdirectory_arrow_right_outlined),
                              );
                            }))));
  }
}
