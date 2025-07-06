import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/app_theme.dart';

class SelectedNavBar extends StatelessWidget {
  SelectedNavBar({required this.imagename});
  String imagename;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(26),
      ),
      child: SvgPicture.asset(
        'assets/icons/$imagename.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
