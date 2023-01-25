import 'package:english_test/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/category_controller.dart';
import '../../../widgets/categoryWidget.dart';

// HomeList is a stateless widget that displays a list of categories
class HomeList extends StatelessWidget {
  // Constructor for the HomeList widget
  const HomeList({super.key, required this.controller, required this.type});

  // The HomeController instance that manages the categories
  final HomeController controller;

  // The type of categories to display (either "word" or "sentence")
  final type;

  // Builds the user interface for the HomeList widget
  @override
  Widget build(BuildContext context) {
    // The list of categories to display
    RxList<HomeModel> listitem;
    if (type == "word") {
      listitem = controller.wordcategorylist;
    } else {
      listitem = controller.sentenceCategorylist;
    }
    // Returns a list view with a list of Category widgets
    return ListView.builder(
        // Makes the list view shrink to fit its children
        shrinkWrap: true,
        // Disables scrolling of the list view
        physics: const ClampingScrollPhysics(),
        // The number of items in the list view
        itemCount: listitem.length,
        // Builds the widgets for the list view
        itemBuilder: (context, index) {
          // Sets the list of categories based on the "type" parameter

          // Returns a Category widget for the current index
          return categoryListWidget(
              listitem[index].name, listitem[index].image);
        }).paddingOnly(bottom: Get.height * 0.05);
  }
}
