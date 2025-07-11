import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/sura.dart';
import 'package:islami_app/taps/quran/sura_details_screen.dart';

class MostRecentlyItem extends StatelessWidget {
  Sura sura;
  MostRecentlyItem(this.sura);

  @override
  Widget build(BuildContext context) {
    Size sizescreen = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetails.routeName,
          arguments: sura,
        );
      },
      child: Container(
        height: double.infinity,
        width: sizescreen.width * 0.7,
        padding: const EdgeInsets.only(left: 12, right: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
              children: [
                Text(
                  sura.englishName,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(color: AppTheme.black),
                ),
                Text(
                  sura.arabicName,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(color: AppTheme.black),
                ),
                Text(
                  '${sura.ayahCount} verses',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: AppTheme.black),
                ),
              ],
            ),
            Image.asset(
              'assets/images/recent_sura.png',
              height: sizescreen.height * 0.14,
              width: sizescreen.width * 0.3,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
