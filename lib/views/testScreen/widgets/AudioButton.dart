import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../color.dart';
import '../../../controller/test_controller.dart';
import '../test.dart';

class AudioPlay extends StatelessWidget {
  late String currentAudio;
  final AudioPlayer player;
  final RxInt current;
  final TestController controller;
  final int index;

  AudioPlay({
    Key? key,
    required this.player,
    required this.current,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Appcolor.primary,
      child: IconButton(
        onPressed: () async {
          controller.currentTest(index);

          // Stop the current audio player
          player.stop();
          if (status.value == true) {
            // If the player is currently playing
            status(false); // Set the status to false
          } else {
            // If the player is not currently playing
            currentAudio = controller.testlist[index].audio;
            current(
                index); // Set the current index to the index passed to this widget
            status(true); // Set the status to true
            await player.play(UrlSource(currentAudio));
          }
        },
        icon: Obx(
          () => Icon(
            (current.value == index && status.value == true)
                ? Icons.pause
                : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
