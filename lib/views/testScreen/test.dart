import 'package:audioplayers/audioplayers.dart';
import 'package:english_test/controller/test_controller.dart';
import 'package:english_test/views/testScreen/widgets/AudioButton.dart';
import 'package:english_test/views/testScreen/widgets/TestBox.dart';
import 'package:english_test/widgets/customButton.dart';
import 'package:english_test/widgets/wrong_answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color.dart';
import '../../widgets/correct_answer.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_data.dart';
import '../../widgets/result.dart';

// Obserable to track if audio is playing
var status = false.obs;

class TestScreen extends StatelessWidget {
  const TestScreen({super.key, this.category});
  final category;
  @override
  Widget build(BuildContext context) {
    // Audio player
    final player = AudioPlayer();
    // Set status to false when audio finishes playing
    player.onPlayerComplete.listen((event) {
      status(false);
    });
    // Create TestController and put it in Get dependency injection system
    TestController controller = Get.put(TestController(category));
    // Obserable to track the current question index
    var current = 0.obs;
    // Map to store answers for each question
    RxMap inputs = {}.obs;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            category,
            style: GoogleFonts.poppins(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => (controller.isloading.value == true)
              // Show loading indicator
              ? loading()
              // Show "No data" message
              : (controller.testlist.isEmpty)
                  ? noData()
                  // Show list of questions
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          // Build list of questions
                          ListView.builder(
                              itemCount: controller.testlist.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                // Set button color for each question
                                controller.buttoncolor["$index"] =
                                    Appcolor.primary;
                                return Obx(() => Container(
                                    color: (controller.currentTest.value ==
                                            index)
                                        ? const Color.fromARGB(65, 3, 168, 244)
                                        : Colors.transparent,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Display question number
                                        Text(
                                          "${(index + 1).toString()}.",
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        AudioPlay(
                                            // This widget displays an audio player and controls for the user to play, pause, and skip tracks.
                                            // It takes in an index, a player instance, a current track, and a controller.
                                            index: index,
                                            player: player,
                                            current: current,
                                            controller: controller),
                                        GestureDetector(
                                          onTap: () {
                                            controller.currentTest(index);
                                            print(controller.currentTest);
                                          },
                                          child: TestBox(
                                              // This widget displays a textbox for entering what user heared.
                                              // It takes in a list of inputs and an index.
                                              inputs: inputs,
                                              index: index),
                                        ),
                                        //check button widget
                                        Obx(() => GestureDetector(
                                              // This widget was for check button that listens for a tap event and executes the code inside the onTap callback.
                                              onTap: (() async {
                                                if (inputs["$index"] == null ||
                                                    inputs["$index"] == "") {
                                                  // If the input field is empty, display a snackbar message asking the user to fill in the field.
                                                  Get.snackbar("Fill the box",
                                                      "Please type what you hear");
                                                } else {
                                                  // Check whether the answer is case sensitive or not.
                                                  if (controller.testlist[index]
                                                          .any ==
                                                      '0') {
                                                    // If the answer is not case sensitive, check whether the input matches the answer.
                                                    if (inputs["$index"]
                                                            .toString() ==
                                                        controller
                                                            .testlist[index]
                                                            .answer
                                                            .toString()) {
                                                      // If the input matches the answer, set the button color to green and call the correctAnswer function.
                                                      controller.buttoncolor[
                                                              "$index"] =
                                                          Colors.green;
                                                      correctAnswer();
                                                    } else {
                                                      // If the input does not match the answer, set the button color to red and call the wrongAnswer function with the correct answer as an argument.
                                                      wrongAnswer(controller
                                                          .testlist[index]
                                                          .answer
                                                          .toString());
                                                      controller.buttoncolor[
                                                              "$index"] =
                                                          Colors.red;
                                                    }
                                                  } else {
                                                    // If the answer is case sensitive, perform the same check but compare the lowercase versions of the input and the answer.
                                                    if (inputs["$index"]
                                                            .toString()
                                                            .toLowerCase() ==
                                                        controller
                                                            .testlist[index]
                                                            .answer
                                                            .toString()
                                                            .toLowerCase()) {
                                                      correctAnswer();
                                                      controller.buttoncolor[
                                                              "$index"] =
                                                          Colors.green;
                                                    } else {
                                                      wrongAnswer(controller
                                                          .testlist[index]
                                                          .answer
                                                          .toString());
                                                      controller.buttoncolor[
                                                              "$index"] =
                                                          Colors.red;
                                                    }
                                                  }
                                                }
                                              }),
                                              //check button design
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      //setting color according to map data
                                                      color: controller
                                                              .buttoncolor[
                                                          "$index"],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  alignment: Alignment.center,
                                                  width: Get.width * 0.18,
                                                  height: Get.height * 0.04,
                                                  child: Text(
                                                    "check",
                                                    //text style of check button text
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Get.height * 0.020),
                                                  )),
                                            )),
                                      ],
                                    )));
                              }),
                          //whole test page final check button
                          Padding(
                            // This widget adds padding to the child widget.
                            padding: EdgeInsets.only(
                                left: Get.width * 0.10,
                                right: Get.width * 0.10,
                                bottom: Get.width * 0.10),
                            child: GestureDetector(
                              // This widget listens for a tap event and executes the code inside the onTap callback.
                              onTap: (() {
                                // Initialize variables to count the number of correct answers and the number of empty input fields.
                                int count = 0, empty = 0;
                                for (int i = 0;
                                    i < controller.testlist.length;
                                    i++) {
                                  // If the input field is empty, display a snackbar message and break out of the loop.
                                  if (inputs["$i"] == null ||
                                      inputs["$i"] == "") {
                                    Get.snackbar("Fill all box",
                                        "Please type what you hear");
                                    empty = empty + 1;
                                    break;
                                  } else {
                                    // Check whether the answer is case sensitive or not.
                                    if (controller.testlist[i].any == '0') {
                                      // If the answer is not case sensitive, check whether the input matches the answer.
                                      if (inputs["$i"].toString() ==
                                          controller.testlist[i].answer
                                              .toString()) {
                                        // If the input matches the answer, increment the count variable.
                                        count = count + 1;
                                      }
                                    } else {
                                      // If the answer is case sensitive, check whether the input matches the answer, ignoring case.
                                      if (inputs["$i"]
                                              .toString()
                                              .toLowerCase() ==
                                          controller.testlist[i].answer
                                              .toString()
                                              .toLowerCase()) {
                                        // If the input matches the answer, ignoring case, increment the count variable.
                                        count = count + 1;
                                      }
                                    }
                                  }
                                }
                                // If there are no empty input fields, display the result.
                                if (empty == 0) {
                                  result(controller.testlist.length.toString(),
                                      count.toString());
                                }
                              }),
                              // This widget displays a custom button with the text "Check Now".
                              child: customButton("Check Now"),
                            ),
                          )
                        ],
                      ),
                    ),
        ));
  }
}
