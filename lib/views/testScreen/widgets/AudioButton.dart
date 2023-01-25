import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../color.dart';
import '../../../controller/test_controller.dart';
import '../test.dart';
class AudioPlay extends StatelessWidget {
  // Add a new variable to keep track of the current audio file
  late String currentAudio;

   AudioPlay(
      {super.key,
      required this.player,
      required this.current,
      required this.controller,
      required this.index});

  final AudioPlayer player;
  final RxInt current;
  final TestController controller;
  final index;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Appcolor.primary,
        child: IconButton(
          onPressed: () async {
            // Stop the current audio player
            player.stop();
            if (status.value == true) {
              // If the player is currently playing
              if (currentAudio != controller.testlist[index].audio) {
                // If the current audio file is not the same as the one clicked
                currentAudio = controller.testlist[index].audio;
                current(index); // Set the current index to the index passed to this widget
                status(false); // Set the status to false
                await player.play(UrlSource(currentAudio));
              } else {
                // If the current audio file is the same as the one clicked
                status(false); // Set the status to false
              }
            } else {
              // If the player is not currently playing
              currentAudio = controller.testlist[index].audio;
              current(index); // Set the current index to the index passed to this widget
              status(true); // Set the status to true
              await player.play(UrlSource(currentAudio));
            }
          },
          icon: Obx(() => Icon(
                // check if current audio index is equal to the index of this widget
                (current.value == index)
                    // if audio is currently playing and index is equal to this widget's index
                    ? (status.value == true)
                        // show pause icon
                        ? Icons.pause
                        // else show play icon
                        : Icons.play_arrow
                    // else show play icon
                    : Icons.play_arrow,
                color: Colors.white,
              )),
        ));
  }
}
