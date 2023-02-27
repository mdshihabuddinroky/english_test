import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';

// const appleId =
//     '1234567890'; // If this value is null, its packagename will be considered
// const playStoreId =
//     'com.icanspell.app'; // If this value is null, its packagename will be considered
// const country = 'Aus'; // If this value is null 'us' will be the default value
void checkUpdate(BuildContext context) async {
  InAppUpdate.checkForUpdate().then((info) {
    info.updateAvailability == UpdateAvailability.updateAvailable
        ? () {
            InAppUpdate.performImmediateUpdate()
                .catchError((e) => Get.snackbar("Error", e.toString()));
          }
        : print("Not available");
  }).catchError((e) {
    Get.snackbar("Error", e.toString());
  });
}
