import 'dart:io';

import 'package:english_test/controller/category_controller.dart';
import 'package:english_test/views/HomeScreen/widgets/HomeTab.dart';
import 'package:english_test/views/HomeScreen/widgets/tabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Services/app_update.dart';
import '../../widgets/drawer.dart';
import 'widgets/homeSearch.dart';

// Home is a stateful widget that displays a search bar, a tab bar, and a tab view
class Home extends StatefulWidget {
  // Constructor for the Home widget
  const Home({super.key});

  // Creates the mutable state for the Home widget
  @override
  State<Home> createState() => _HomeState();
}

// _HomeState represents the mutable state for the Home widget
class _HomeState extends State<Home> with TickerProviderStateMixin {
  // Late initializes the _tabController field
  late TabController _tabController;

  // Initializes the _tabController field when the Home widget is inserted into the tree
  @override
  void initState() {
    super.initState();

    // Initializes the _tabController field with a new TabController object
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.animateTo(2);
  }

  // Initializes the _key field with a new GlobalKey object
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  // Builds the user interface for the Home widget
  @override
  Widget build(BuildContext context) {
    //`checkUpdate(context);
    // Gets the height and width of the display screen
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // Creates a new HomeController object and adds it to the Get dependency injection container
    HomeController controller = Get.put(HomeController());

    // Returns a Scaffold widget with a drawer, a SafeArea widget with a SingleChildScrollView widget as its child, and a Column widget as the child of the SingleChildScrollView widget
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      drawer: customDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // Row with an icon button and a text widget for the app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => _key.currentState!.openDrawer(),
                      icon: const Icon(Icons.menu)),
                  SizedBox(
                    width: Get.width * 0.10,
                  ),
                  Text("I CAN SPELL",
                      style: GoogleFonts.poppins(
                          fontSize: 22, color: Colors.black))
                ],
              ).paddingOnly(top: 5),
              // HomeSearch widget
              HomeSearch(width: width, height: height),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),

                    //tabbar widget
                    HomeTab(tabController: _tabController),
                    //tabbar view widget
                    HomeTabView(
                        tabController: _tabController, controller: controller),
                  ],
                ),
              ),
            ],
          ),
        ).paddingOnly(left: width * 0.05, right: width * 0.05),
      ),
    );
  }
}
