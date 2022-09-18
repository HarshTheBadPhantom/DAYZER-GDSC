import 'dart:ui';

import 'package:dayzer/Home/homepagecontroller.dart';
import 'package:dayzer/Message/message_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dayzer/Themes/themes.dart';

bottomSheetWidget({bool dismissible = true, double initialChild = 0.75}) {
  HomePageController controller = Get.find();
  Get.bottomSheet(
          SafeArea(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: DraggableScrollableSheet(
                maxChildSize: 1,
                minChildSize: 0.2,
                initialChildSize: initialChild,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return MessageSheet(
                    scrollController: scrollController,
                  );
                },
              ),
            ),
          ),
          backgroundColor: Get.theme.colorPrimary,
          useRootNavigator: true,
          isDismissible: dismissible,
          enableDrag: dismissible,
          isScrollControlled: true
          // shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          )
      .whenComplete(() => {
            controller.isMessageSheetOpen.value = false,
            controller.bottomItemIndex.value = 0
          });
}
