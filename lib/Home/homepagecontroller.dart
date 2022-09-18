import 'package:dayzer/Home/homepage.dart';
import 'package:dayzer/utilities/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  var bottomItemIndex = 0.obs;
  var isMessageSheetOpen = false.obs;
  void updateIndex(int i) {
    bottomItemIndex.value = i;
    switch (i) {
      case 0:
        if (isMessageSheetOpen.value == true) {
          Get.back();
        }
        Get.to(() => const HomePage());
        break;

      case 1:
        break;
      case 2:
        isMessageSheetOpen.value = true;
        bottomSheetWidget();
    }
  }
}
