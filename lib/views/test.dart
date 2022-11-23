import 'package:audioplayers/audioplayers.dart';
import 'package:english_test/controller/test_controller.dart';
import 'package:english_test/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
              ? const Center(child: CircularProgressIndicator())
              : (controller.testlist.isEmpty)
                  ? Center(
                      child: Text(
                        "No data found",
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: controller.testlist.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                        leading: CircleAvatar(
                                            child: IconButton(
                                          onPressed: () async {
                                            player.stop();
                                            if (status.value == true &&
                                                current.value != index) {
                                              status(false);

                                              current(index);
                                              status(true);
                                              await player.play(UrlSource(
                                                  "${controller.testlist[index].audio}"));
                                            } else {
                                              current(index);
                                              status(true);
                                              await player.play(UrlSource(
                                                  "${controller.testlist[index].audio}"));
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
                                        title: SizedBox(
                                          width: Get.width * 0.78,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor:
                                                  const Color(0xfff4f4fa),
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              hintText: "Type what you hear",
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 210, 203, 203),
                                                    width: 1.0),
                                              ),
                                            ),
                                            onChanged: ((value) {
                                              inputs["$index"] = value;
                                            }),
                                          ),
                                        ),
                                        trailing: GestureDetector(
                                          onTap: (() async {
                                            // if (inputs["$index"] ==
                                            //     controller
                                            //         .testlist[index].answer)
                                            if (inputs["$index"] == null ||
                                                inputs["$index"] == "") {
                                              Get.snackbar("Fill the box",
                                                  "Please type what you hear");
                                            } else if (inputs["$index"]
                                                .toString()
                                                .contains(controller
                                                    .testlist[index].answer
                                                    .toString())) {
                                              Get.defaultDialog(
                                                  title: "Correct Answer",
                                                  titleStyle:
                                                      GoogleFonts.roboto(
                                                          fontSize: 25),
                                                  content: SizedBox(
                                                    height: Get.height * 0.30,
                                                    child: Lottie.asset(
                                                        "assets/correct.json"),
                                                  ));
                                            } else {
                                              Get.defaultDialog(
                                                  title: "Wrong Answer",
                                                  titleStyle:
                                                      GoogleFonts.roboto(
                                                          fontSize: 25),
                                                  content: Column(
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.30,
                                                        child: Lottie.asset(
                                                            "assets/wrong.json",
                                                            fit: BoxFit.cover),
                                                      ).paddingAll(2),
                                                      Text(
                                                        "Try Again",
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.10,
                                                        child: Text(
                                                          "Correct Answer: ${controller.testlist[index].answer.toString()}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 18),
                                                        ),
                                                      ),
                                                    ],
                                                  ));
                                            }
                                          }),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
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
                                        )));
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
                                    if (inputs["$i"].toString().contains(
                                        controller.testlist[i].answer
                                            .toString())) {
                                      count = count + 1;
                                    }
                                  }
                                }
                                if (empty == 0) {
                                  Get.defaultDialog(
                                      title: "Your Result",
                                      titleStyle:
                                          GoogleFonts.roboto(fontSize: 25),
                                      content: SizedBox(
                                        height: Get.height * 0.55,
                                        width: Get.width * 0.80,
                                        child: Scaffold(
                                          body: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${controller.testlist.length}/$count",
                                                  style: GoogleFonts.ptSans(
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Lottie.asset(
                                                    fit: BoxFit.cover,
                                                    "assets/congrats.json"),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(() => const Home());
                                                  },
                                                  child: Container(
                                                      width: Get.width * 0.70,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.redAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      height: Get.height * 0.05,
                                                      child: Text(
                                                        "Go to home",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    Get.height *
                                                                        0.020),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                }
                              }),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  height: Get.height * 0.06,
                                  child: Text(
                                    "check",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.020),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
        ));
  }
}
