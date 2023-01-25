// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

//widget screen textfield custom widget
class TestBox extends StatelessWidget {
  const TestBox({super.key, required this.inputs, required this.index});

// RxMap to hold the input value for each TextField
  final RxMap inputs;

// Index of the TextField
  final index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.58,
      child: TextField(
// Set max and min number of lines for the TextField
        maxLines: 5,
        minLines: 1,
        decoration: InputDecoration(
// Set the color for the TextField background
          fillColor: const Color(0xfff4f4fa),
// Set the Icon for the TextField
          prefixIcon: const Icon(Icons.search),
// Set the hint text for the TextField
          hintText: "Type what you hear",
// Set the hint text style
          hintStyle: const TextStyle(color: Colors.grey),
// Set the focused border for the TextField
          focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 1, 1, 12), width: 1.0),
          ),
// Set the enabled border for the TextField
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 20, 189, 240), width: 1.0),
          ),
        ),
// Set the onChanged event for the TextField
        onChanged: ((value) {
// Assign the value to the RxMap at the index
          inputs["$index"] = value;
        }),
      ),
    );
  }
}
