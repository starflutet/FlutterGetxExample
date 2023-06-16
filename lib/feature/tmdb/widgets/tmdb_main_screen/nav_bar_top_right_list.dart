import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarTopRightList extends StatelessWidget {
  final double horizonParam;
  final IconData iconsParam;
  final Color colorParam;
  final double sizeParam;

  const NavBarTopRightList({
    super.key,
    required this.horizonParam,
    required this.iconsParam,
    required this.colorParam,
    required this.sizeParam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizonParam),
      child: Icon(
        iconsParam,
        color: colorParam,
        size: sizeParam,
      ),
    );
  }
}
