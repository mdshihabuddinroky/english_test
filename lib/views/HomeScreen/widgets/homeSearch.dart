import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../searchPage.dart';

// HomeSearch is a stateless widget that displays a search bar and an icon button
class HomeSearch extends StatelessWidget {
  // Constructor for the HomeSearch widget
  const HomeSearch({
    super.key,
    required this.width,
    required this.height,
  });

  // The width of the display screen
  final double width;

  // The height of the display screen
  final double height;

  // Builds the user interface for the HomeSearch widget
  @override
  Widget build(BuildContext context) {
    // Returns a row with a text field, a sized box, and an icon button
    return Row(
      children: [
        SizedBox(
            // Width of the text field
            width: width * 0.75,
            // Height of the text field
            height: height * 0.060,
            // Text field that allows users to search for items
            child: TextField(
              // Disables editing of the text field
              readOnly: true,
              // When tapped, opens the SearchPage widget
              onTap: (() {
                Get.to(() => const SearchPage());
              }),
              // Customizes the appearance of the text field
              decoration: const InputDecoration(
                // Text label for the text field
                labelText: "Search..",
                // Fills the text field with a color
                filled: true,
                // Background color of the text field
                fillColor: Color(0xfff4f4fa),
                // Icon displayed at the start of the text field
                prefixIcon: Icon(
                  Icons.search,
                ),
                // Placeholder text for the text field
                hintText: "Search",
                // Style for the placeholder text
                hintStyle: TextStyle(fontSize: 18),
                // Style for the focused border of the text field
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                // Style for the enabled border of the text field

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 210, 203, 203), width: 1.0),
                ),
              ),
            )),
        SizedBox(
          width: width * 0.02,
        ),
        //search button. on click on that button it will open search page
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
    );
  }
}
