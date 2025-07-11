import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/views/onboarding_data_class.dart';

class OnboardingItem extends StatelessWidget {
  OnboardingDataClass page = OnboardingDataClass();
  OnboardingItem({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
        
          children: [
            Image.asset(
              'assets/images/${page.image}.png',
              height: 415,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Text(
              '${page.title}',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: AppTheme.primaryColor),
            ),
            Text(
              '${page.description}',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: AppTheme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
