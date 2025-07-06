import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselected extends StatelessWidget {
  String imagename;
  NavBarUnselected({required this.imagename});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$imagename.svg',
      height: 22,
      width: 22,
      fit: BoxFit.fill,
    );
  }
}
