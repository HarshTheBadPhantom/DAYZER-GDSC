import 'package:dayzer/Themes/themes.dart';
import 'package:dayzer/utilities/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageSheet extends StatelessWidget {
  MessageSheet({Key? key, this.scrollController}) : super(key: key);
  ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.sheetColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.close_rounded)),
                    Container(
                      height: 4,
                      width: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                    ),
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.more_horiz_rounded)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Messaging ID', style: Get.theme.kTitleTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your daily plan',
                      style: Get.theme.kSubTitleTextStyle,
                    ),
                    Text(
                      '70%',
                      style: Get.theme.kSmallTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Get.theme.curveBG.withOpacity(0.9),
                  color: Colors.black,
                  minHeight: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  '4 of 6 completed',
                  style:
                      Get.theme.kSmallTextStyle.copyWith(color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 18, bottom: 18),
                      decoration: BoxDecoration(
                        color: Get.theme.colorAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '17',
                              style: Get.theme.kTitleTextStyle,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.task_rounded,
                                size: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Tasks finished',
                                  style: Get.theme.kSmallTextStyle
                                      .copyWith(color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 18, bottom: 18),
                      decoration: BoxDecoration(
                        color: Get.theme.colorAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '3,2',
                              style: Get.theme.kTitleTextStyle,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later,
                                size: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Tracked hours',
                                  style: Get.theme.kSmallTextStyle
                                      .copyWith(color: Colors.black54),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Overview',
                  style: Get.theme.kNormalTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Messaging ID framework development for the  marketing branch and the publicity bureau and implemented a draft on the framework',
                  style: Get.theme.kSmallTextStyle
                      .copyWith(color: Colors.black54, height: 1.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Members connected',
                  style: Get.theme.kNormalTextStyle,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    avatarsWidget('profile1', index: 1),
                    avatarsWidget('profile2'),
                    avatarsWidget('profile3'),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Get.theme.btnTextCol.withOpacity(0.1),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBarWidget(),
      ),
    );
  }

  Widget avatarsWidget(String url, {int? index}) {
    return Padding(
      padding: EdgeInsets.only(left: index == 1 ? 20 : 10, right: 10, top: 15),
      child: CircleAvatar(
        radius: 28,
        foregroundImage: AssetImage('assets/images/$url.jpg'),
      ),
    );
  }
}
