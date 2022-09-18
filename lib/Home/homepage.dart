import 'package:dayzer/Home/homepagecontroller.dart';
import 'package:dayzer/utilities/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dayzer/Themes/themes.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorSecondary,
      appBar: PreferredSize(
        preferredSize: Size(Get.size.width, 50),
        child: Obx(
          () => AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: controller.isMessageSheetOpen.value
                  ? Get.theme.colorPrimary
                  : Get.theme.colorSecondary,
            ),
            elevation: 0,
            backgroundColor: Get.theme.colorSecondary,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    foregroundImage:
                        AssetImage('assets/images/test-profile.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Hi, Harsh!',
                      style: Get.theme.kSubTitleTextStyle.copyWith(
                          color: Get.theme.btnTextCol.withOpacity(0.7)),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.notifications_rounded,
                      color: Get.theme.dayNight,
                    )),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Tasks for today:',
                  style: Get.theme.kMedTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber[400],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '5 Available',
                        style: Get.theme.kSmallTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefix: const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search_rounded),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search',
                    hintStyle: Get.theme.kSubTitleTextStyle
                        .copyWith(color: Get.theme.btnTextCol.withOpacity(0.6)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Last connections',
                      style: Get.theme.kNormalTextStyle,
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: Text(
                          'See all',
                          style: Get.theme.kSmallTextStyle.copyWith(
                              color: Get.theme.btnTextCol.withOpacity(0.6)),
                        ))
                  ],
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
                    avatarsWidget('profile4'),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Get.theme.btnTextCol.withOpacity(0.1),
                        child: Text(
                          '+5',
                          style: Get.theme.kSmallTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                height: Get.size.height,
                decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Active projects',
                            style: Get.theme.kNormalTextStyle,
                          ),
                          TextButton(
                              onPressed: () => {},
                              child: Text(
                                'See all',
                                style: Get.theme.kSmallTextStyle.copyWith(
                                    color:
                                        Get.theme.btnTextCol.withOpacity(0.6)),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    projectCard(
                        title: 'Numero 10',
                        subtitle: 'Blog and Social posts',
                        deadline: 'Today',
                        time: '4h'),
                    projectCard(
                        title: 'Grace Aroma',
                        subtitle: 'New capmain review',
                        deadline: 'Tommorow',
                        time: '7d'),
                    projectCard(
                        title: 'Harsh Kothari',
                        subtitle: 'GDSC Tasks',
                        deadline: '18th of sept',
                        time: '2h'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBarWidget(),
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

  Widget projectCard(
      {required String title,
      required String subtitle,
      required String deadline,
      required String time}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(22),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black45),
          borderRadius: BorderRadius.circular(12),
        ),
        horizontalTitleGap: 20,
        title: Text(title,
            style: Get.theme.kSmallTextStyle
                .copyWith(color: Get.theme.btnTextCol.withOpacity(0.3))),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: Get.theme.kNormalTextStyle.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Get.theme.btnTextCol.withOpacity(0.7),
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Deadline is $deadline',
                  style: Get.theme.kSubTitleTextStyle
                      .copyWith(color: Get.theme.btnTextCol.withOpacity(0.7)),
                )
              ],
            ),
          ],
        ),
        trailing: Text(
          time,
          style: Get.theme.kSmallTextStyle
              .copyWith(color: Get.theme.btnTextCol.withOpacity(0.3)),
        ),
      ),
    );
  }
}
