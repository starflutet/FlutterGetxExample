import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../member/controllers/auth/auth_controller.dart';
import '../widgets/tmdb_main_screen/main_banner.dart';
import '../widgets/tmdb_main_screen/nav_bar_top_left_list.dart';
import '../widgets/tmdb_main_screen/nav_bar_top_right_list.dart';
import '../widgets/tmdb_main_screen/tranding_title.dart';
import '../widgets/tmdb_main_screen/trending_view.dart';

class TmdbMainScreen extends StatelessWidget {
  const TmdbMainScreen({
    super.key,
  });

  @override
  Scaffold build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double paddingValue = (screenWidth * 0.24).clamp(20, double.infinity);

    final AuthController tokenController = Get.find();
    final token = tokenController.token.value;

    if (token == "") {
      Navigator.of(context).pop();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('알림'),
              content: Text('로그인 후, 이용이 가능합니다!'),
              actions: [
                TextButton(
                  child: Text('확인'),
                  onPressed: () {
                    Navigator.of(context).pop(); // 경고창 닫기
                  },
                ),
              ],
            );
          },
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xFF032541),
        foregroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: Container(),
        ),
        title: Padding(
          padding: EdgeInsets.only(
            left: paddingValue,
            top: 20,
            right: paddingValue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  NavBarTopLeftList(
                    switchParam: 0,
                    horizonParam: 20,
                    widthParam: 140,
                    imgUrlParam: 'images/Logo.png',
                  ),
                  NavBarTopLeftList(
                    switchParam: 1,
                    titleParam: '영화',
                    colorParam: Colors.white,
                    fontSizeParam: 15,
                    letterSpacingParam: 1,
                  ),
                  NavBarTopLeftList(
                    switchParam: 1,
                    titleParam: 'TV프로그램',
                    colorParam: Colors.white,
                    fontSizeParam: 15,
                    letterSpacingParam: 1,
                  ),
                  NavBarTopLeftList(
                    switchParam: 1,
                    titleParam: '인물',
                    colorParam: Colors.white,
                    fontSizeParam: 15,
                    letterSpacingParam: 1,
                  ),
                  NavBarTopLeftList(
                    switchParam: 1,
                    titleParam: 'More',
                    colorParam: Colors.white,
                    fontSizeParam: 15,
                    letterSpacingParam: 1,
                  ),
                ],
              ),
              Row(
                children: [
                  NavBarTopRightList(
                    colorParam: Colors.deepPurpleAccent,
                    horizonParam: 5,
                    iconsParam: Icons.add,
                    sizeParam: 35,
                  ),
                  NavBarTopRightList(
                    colorParam: Colors.amber,
                    horizonParam: 5,
                    iconsParam: Icons.keyboard_outlined,
                    sizeParam: 35,
                  ),
                  NavBarTopRightList(
                    colorParam: Colors.teal,
                    horizonParam: 5,
                    iconsParam: Icons.access_alarms,
                    sizeParam: 35,
                  ),
                  NavBarTopRightList(
                    colorParam: Colors.greenAccent,
                    horizonParam: 5,
                    iconsParam: Icons.circle_notifications_rounded,
                    sizeParam: 35,
                  ),
                  NavBarTopRightList(
                    colorParam: Color(0xFF01b4e4),
                    horizonParam: 5,
                    iconsParam: Icons.search,
                    sizeParam: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 400),
        child: Container(
          color: Color(0xFFffffff),
          child: Column(
            children: [
              MainBanner(screenWidthParam: screenWidth),
              Container(
                height: 100,
                color: Colors.white,
                child: TrandingTitle(),
              ),
              SizedBox(
                height: 350,
                child: TrendingView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
