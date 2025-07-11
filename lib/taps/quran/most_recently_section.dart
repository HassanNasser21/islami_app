import 'package:flutter/material.dart';
import 'package:islami_app/taps/quran/most_recently_item.dart';
import 'package:islami_app/taps/quran/quran_service.dart';
import 'package:islami_app/taps/quran/sura.dart';

class MostRecentlySection extends StatelessWidget {
  const MostRecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: QuranService.mostrecentlysuras.isNotEmpty,
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Recently',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    MostRecentlyItem(QuranService.mostrecentlysuras.reversed.toList()[index]),
                separatorBuilder: (_, _) => SizedBox(width: 10),
                itemCount: QuranService.mostrecentlysuras.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
