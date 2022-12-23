import 'package:english_test/controller/searchController.dart';
import 'package:english_test/views/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/no_data.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtcontroller = TextEditingController();
    final SearchController controller = Get.put(SearchController());
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: SizedBox(
              height: Get.height * 0.06,
              child: TextField(
                onChanged: ((value) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    controller.fetchProducts(value);
                  });
                }),
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
            //loading
            (controller.isloading.value)
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                :
                //not search yet
                (controller.isloading.value == false &&
                        controller.searchlist.isEmpty &&
                        txtcontroller.text.isEmpty)
                    ? Center(
                        child: Text(
                          "",
                          style: GoogleFonts.poppins(fontSize: 20),
                        ),
                      )
                    :
                    //search but no data
                    (controller.isloading.value == false &&
                            controller.searchlist.isEmpty)
                        ? noData()
                        :
                        //search result
                        ListView.builder(
                            itemCount: controller.searchlist.length,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                onTap: (() => Get.to(() => TestScreen(
                                      category: controller
                                          .searchlist[index].category
                                          .toString(),
                                    ))),
                                leading: const Icon(Icons.search),
                                title: Text(
                                  controller.searchlist[index].category
                                      .toString(),
                                ),
                                trailing: const Icon(
                                    Icons.subdirectory_arrow_right_outlined),
                              );
                            }))));
  }
}
