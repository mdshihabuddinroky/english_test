import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../color.dart';

// Widget to display a loading animation
Widget loading() {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
// Use the Staggered Dots Wave loading animation from the 'loading_animation_widget' library
      color: Appcolor
          .primary, // Set the color to the primary color defined in the 'Appcolor' class
      size: 50, // Set the size of the animation to 50 pixels
    ),
  );
}
