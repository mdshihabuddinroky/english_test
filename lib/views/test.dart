import 'package:audioplayers/audioplayers.dart';
import 'package:english_test/controller/test_controller.dart';
import 'package:english_test/widgets/customButton.dart';
import 'package:english_test/widgets/wrong_answer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color.dart';
import '../widgets/correct_answer.dart';
import '../widgets/loading.dart';
import '../widgets/no_data.dart';
import '../widgets/result.dart';

var status = false.obs;

class TestScreen extends StatelessWidget {
  const TestScreen({super.key, this.category});
  final category;
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    player.onPlayerComplete.listen((event) {
      status(false);
    });
    TestController controller = Get.put(TestController(category));
    var current = 0.obs;
    RxMap inputs = {}.obs;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            category,
            style: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Obx(
          () => (controller.isloading.value == true)
              //loading
              ? loading()
              //no data
              : (controller.testlist.isEmpty)
                  ? noData()
                  //list after loading
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: controller.testlist.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                controller.buttoncolor["$index"] =
                                    Appcolor.primary;
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${(index + 1).toString()}.",
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        CircleAvatar(
                                            backgroundColor: Appcolor.primary,
                                            child: IconButton(
                                              onPressed: () async {
                                                player.stop();
                                                if (status.value == true &&
                                                    current.value != index) {
                                                  status(false);

                                                  current(index);
                                                  status(true);
                                                  await player.play(UrlSource(
                                                      controller.testlist[index]
                                                          .audio));
                                                } else {
                                                  current(index);
                                                  status(true);
                                                  await player.play(UrlSource(
                                                      controller.testlist[index]
                                                          .audio));
                                                }
                                              },
                                              icon: Obx(() => Icon(
                                                    (current.value == index)
                                                        ? (status.value == true)
                                                            ? Icons.pause
                                                            : Icons.play_arrow
                                                        : Icons.play_arrow,
                                                    color: Colors.white,
                                                  )),
                                            )),
                                        SizedBox(
                                          width: Get.width * 0.58,
                                          child: TextField(
                                            maxLines: 5,
                                            minLines: 1,
                                            decoration: InputDecoration(
                                              fillColor:
                                                  const Color(0xfff4f4fa),
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              hintText: "Type what you hear",
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 1, 1, 12),
                                                    width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 20, 189, 240),
                                                    width: 1.0),
                                              ),
                                            ),
                                            onChanged: ((value) {
                                              inputs["$index"] = value;
                                            }),
                                          ),
                                        ),
                                        Obx(() => GestureDetector(
                                              onTap: (() async {
                                                if (inputs["$index"] == null ||
                                                    inputs["$index"] == "") {
                                                  Get.snackbar("Fill the box",
                                                      "Please type what you hear");
                                                } else {
                                                  //checking answer is case sensitive or not. if any=0 then asnwer isn't case sensitive
                                                  if (controller.testlist[index]
                                                          .any ==
                                                      '0') {
                                                    //checking answer is wrong or right for case sensitive
                                                    if (inputs["$index"]
                                                            .toString() ==
                                                        controller
                                                            .testlist[index]
                                                            .answer
                                                            .toString()) {
                                                      controller.buttoncolor[
                                                              "$index"] =
                                                          Colors.green;

                                                      correctAnswer();
                                                    } else {
                                                      wrongAnswer(controller
                                                          .testlist[index]
                                                          .answer
                                                          .toString());
                                                      controller.buttoncolor[
                                                              "$index"] =
                                                          Colors.red;
                                                    }
                                                  } else {
                                                    //checking answer is wrong or right for case sensitive
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
                                              child: Container(
                                                  decoration: BoxDecoration(
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
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Get.height * 0.020),
                                                  )),
                                            )),
                                      ],
                                    ));
                              }),
                          Padding(
                            padding: EdgeInsets.only(
                                left: Get.width * 0.10,
                                right: Get.width * 0.10,
                                bottom: Get.width * 0.10),
                            child: GestureDetector(
                                onTap: (() {
                                  int count = 0, empty = 0;
                                  for (int i = 0;
                                      i < controller.testlist.length;
                                      i++) {
                                    // if (inputs["$i"] ==
                                    //     controller.testlist[i].answer)
                                    if (inputs["$i"] == null ||
                                        inputs["$i"] == "") {
                                      Get.snackbar("Fill all box",
                                          "Please type what you hear");
                                      empty = empty + 1;
                                      break;
                                    } else {
                                      if (controller.testlist[i].any == '0') {
                                        if (inputs["$i"].toString() ==
                                            controller.testlist[i].answer
                                                .toString()) {
                                          count = count + 1;
                                        }
                                      } else {
                                        if (inputs["$i"]
                                                .toString()
                                                .toLowerCase() ==
                                            controller.testlist[i].answer
                                                .toString()
                                                .toLowerCase()) {
                                          count = count + 1;
                                        }
                                      }
                                    }
                                  }
                                  if (empty == 0) {
                                    result(
                                        controller.testlist.length.toString(),
                                        count.toString());
                                  }
                                }),
                                child: customButton("Check Now")),
                          )
                        ],
                      ),
                    ),
        ));
  }
}
