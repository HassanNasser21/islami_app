import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/quran/quran_service.dart';
import 'package:islami_app/taps/quran/sura.dart';
import 'package:islami_app/taps/quran/sura_details_screen.dart';
import 'package:islami_app/taps/quran/sura_item.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  AppTheme.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              hintText: 'Sura Name',
            ),
            onChanged: (query) {
              QuranService.searchSura(query);
              setState(() {});
            },
          ),
        ),
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
            itemBuilder: (context, index) {
              Sura sura = QuranService.suras[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  SuraDetails.routeName,
                  arguments: sura,
                ),
                child: SuraItem(sura: sura),
              );
            },
            itemCount: QuranService.suras.length,
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
