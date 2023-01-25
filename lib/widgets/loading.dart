import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../color.dart';

Widget loading() {
  return Center(
    child: LoadingAnimationWidget.staggeredDotsWave(
      color: Appcolor.primary,
      size: 50,
    ),
  );
}
