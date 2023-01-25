import 'package:english_test/views/HomeScreen/widgets/List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import the controller that manages the state for this view
import '../../../controller/category_controller.dart';

// Import the loading and no data widgets
import '../../../widgets/loading.dart';
import '../../../widgets/no_data.dart';

// Define the HomeTabView widget
class HomeTabView extends StatelessWidget {
  // Constructor for the HomeTabView widget
  const HomeTabView({
    // Key for the widget
    super.key,
    // Required tab controller for the TabBarView
    required TabController tabController,
    // Required controller for managing the state of this view
    required this.controller,
  }) : _tabController = tabController;

  // Private member for storing the tab controller
  final TabController _tabController;
  // Private member for storing the state controller
  final HomeController controller;

  // Build method for the widget
  @override
  Widget build(BuildContext context) {
    // Return a SizedBox widget with the height set to 80% of the screen height
    // and the child set to a TabBarView widget
    return SizedBox(
      height: Get.height * 0.80,
      child: TabBarView(
          // Set the tab controller for the TabBarView
          controller: _tabController,
          // Set the children of the TabBarView to be a list of widgets
          children: [
            // The first tab is for displaying a list of words
            Obx(() => (
                // If the HomeController is currently loading data, display the loading widget
                (controller.isloading_word.value)
                    ? loading()
                    // If the list of words is empty, display the no data widget
                    : (controller.wordcategorylist.isEmpty)
                        ? noData()
                        // Otherwise, display the HomeList widget with the type set to "word"
                        : HomeList(controller: controller, type: "word"))),
            // The second tab is for displaying a list of sentences
            Obx(() => (
                // If the HomeController is currently loading data, display the loading widget
                (controller.isloading_sentence.value)
                    ? loading()
                    // If the list of sentences is empty, display the no data widget
                    : (controller.sentenceCategorylist.isEmpty)
                        ? noData()
                        // Otherwise, display the HomeList widget with the type set to "sentence"
                        : HomeList(controller: controller, type: "sentence"))),
          ]),
    );
  }
}
