import 'package:english_test/controller/category_controller.dart';
import 'package:english_test/views/html_view.dart';
import 'package:english_test/views/searchPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/categoryWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    // _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text("I CAN SPELL",
            style: GoogleFonts.poppins(fontSize: 22, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                onTap: (() {
                  Get.back();
                  Get.to(() => const SideBarView(title: "Privacy Policy"));
                }),
                title: Text(
                  "Privacy Policy",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                leading: const Icon(Icons.security_outlined),
              ),
              ListTile(
                onTap: (() {
                  Get.back();
                  Get.to(() => const SideBarView(title: "Terms & Condition"));
                }),
                title: Text(
                  "Terms & Condition",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                leading: const Icon(Icons.notes_sharp),
              ),
              ListTile(
                onTap: (() {
                  Get.back();
                  Get.to(() => const SideBarView(title: "About us"));
                }),
                title: Text(
                  "About us",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                leading: const Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            children: [
              //search widget start
              Row(
                children: [
                  SizedBox(
                      width: width * 0.75,
                      height: height * 0.060,
                      child: TextField(
                        readOnly: true,
                        onTap: (() {
                          Get.to(() => const SearchPage());
                        }),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xfff4f4fa),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 210, 203, 203),
                                width: 1.0),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  IconButton(
                      onPressed: (() {
                        Get.to(() => const SearchPage());
                      }),
                      icon: const Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.black,
                      ))
                ],
              ),
//search widget finished
              //Search bar
              SizedBox(
                height: height * 0.01,
              ),

//tabbar start
              TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black45,
                  labelStyle: GoogleFonts.aBeeZee(
                    fontSize: 18,
                  ),
                  tabs: const [
                    Tab(
                      text: "Words",
                    ),
                    Tab(
                      text: "Sentences",
                    )
                  ]),
              SizedBox(
                height: Get.height * 0.80,
                child: TabBarView(controller: _tabController, children: [
                  Obx(() => (controller.isloading_word.value)
                      ? const Center(child: CircularProgressIndicator())
                      : (controller.wordcategorylist.isEmpty)
                          ? Center(
                              child: Text(
                                "No data found",
                                style: GoogleFonts.poppins(fontSize: 20),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.wordcategorylist.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return categoryListWidget(
                                    controller.wordcategorylist[index].name,
                                    controller.wordcategorylist[index].image);
                              })),
                  Obx(() => (controller.isloading_sentence.value)
                      ? const Center(child: CircularProgressIndicator())
                      : (controller.sentenceCategorylist.isEmpty)
                          ? Center(
                              child: Text(
                                "No data found",
                                style: GoogleFonts.poppins(fontSize: 20),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.sentenceCategorylist.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return categoryListWidget(
                                    controller.sentenceCategorylist[index].name,
                                    controller
                                        .sentenceCategorylist[index].image);
                              })),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
