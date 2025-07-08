import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

class BuildTapHeader extends StatelessWidget {
  final String label;
  final bool selected;
  final double width;
  final VoidCallback onTap;
  BuildTapHeader({
    required this.label,
    required this.selected,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? AppTheme.primaryColor : AppTheme.black.withValues(alpha: 0.7),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: selected ? AppTheme.black : AppTheme.white,
          ),
        ),
      ),
    );
  }
}
