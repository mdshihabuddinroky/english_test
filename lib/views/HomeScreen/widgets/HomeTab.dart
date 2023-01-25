import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// HomeTab is a stateless widget that displays a tab bar with two tabs
class HomeTab extends StatelessWidget {
  // Constructor for the HomeTab widget
  const HomeTab({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  // The tab controller for the HomeTab widget
  final TabController _tabController;

  // Builds the user interface for the HomeTab widget
  @override
  Widget build(BuildContext context) {
    // Returns a tab bar with two tabs
    return TabBar(
        // The tab controller for the tab bar
        controller: _tabController,
        // Color of the selected tab's label
        labelColor: Colors.black,
        // Color of the selected tab's indicator
        indicatorColor: Colors.black45,
        // Style for the labels of the tabs
        labelStyle: GoogleFonts.aBeeZee(
          fontSize: 18,
        ),
        // The tabs in the tab bar
        tabs: const [
          // The first tab
          Tab(
            // The text label for the first tab
            text: "Words",
          ),
          // The second tab
          Tab(
            // The text label for the second tab
            text: "Sentences",
          )
        ]);
  }
}
