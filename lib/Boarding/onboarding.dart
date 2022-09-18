import 'package:dayzer/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dayzer/Themes/themes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorPrimary,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Get.theme.colorPrimary,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Transform.rotate(
              angle: 45,
              child: const Icon(
                Icons.auto_awesome_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/app_logo.svg',
              height: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Dayzer',
              style: Get.theme.kTitleTextStyle,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              'To simplify the way you work',
              textAlign: TextAlign.center,
              style: Get.theme.kBigTextStyle,
            ),
          ),
          SvgPicture.asset('assets/images/beach.svg', height: 200),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text('Controlling deliveries in reliable and no-hassle way.',
                style: Get.theme.kSubTitleTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: Colors.white,
                  backgroundColor: Colors.black87,
                  fixedSize: Size(Get.size.width, 60)),
              onPressed: () => Get.to(() => const HomePage()),
              child:
                  Text('Get free trial', style: Get.theme.kSubTitleTextStyle),
            ),
          ),
        ]),
      ),
    );
  }
}
