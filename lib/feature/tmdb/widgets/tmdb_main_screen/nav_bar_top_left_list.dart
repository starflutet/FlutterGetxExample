import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarTopLeftList extends StatelessWidget {
  final int switchParam;

  //아이콘일때
  final double? horizonParam;
  final double? widthParam;
  final String? imgUrlParam;

  //글일때
  final String? titleParam;
  final Color? colorParam;
  final double? fontSizeParam;
  final double? letterSpacingParam;

  const NavBarTopLeftList({
    super.key,
    required this.switchParam,
    this.horizonParam,
    this.widthParam,
    this.imgUrlParam,
    this.titleParam,
    this.colorParam,
    this.fontSizeParam,
    this.letterSpacingParam,
  });

  @override
  Widget build(BuildContext context) {
    if (switchParam == 0) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: horizonParam!),
        width: widthParam,
        child: Image.asset(imgUrlParam!),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          titleParam!,
          style: TextStyle(
            fontSize: fontSizeParam!,
            color: colorParam!,
            letterSpacing: letterSpacingParam,
          ),
        ),
      );
    }
  }
}
