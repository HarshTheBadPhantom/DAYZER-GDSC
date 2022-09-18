import 'package:dayzer/Home/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dayzer/Themes/themes.dart';

class BottomBarWidget extends GetView<HomePageController> {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          showSelectedLabels: false,
          currentIndex: controller.bottomItemIndex.value,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Get.theme.btnTextCol.withOpacity(0.2),
          onTap: ((i) => controller.updateIndex(i)),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_rounded),
              label: '',
            ),
          ]),
    );
  }
}
