import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran_service.dart';
import 'package:islami_app/taps/quran/sura_details_screen.dart';
import 'package:islami_app/taps/quran/sura_item.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Suras List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, SuraDetails.routeName,arguments: QuranService.suras[index]),
              child: SuraItem(sura: QuranService.suras[index]),
            ),
            itemCount: QuranService.arabicsuraNames.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: AppTheme.white,
              endIndent: screenWidth * 0.1,
              indent: screenWidth * 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
