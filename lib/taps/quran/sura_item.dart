import 'package:flutter/material.dart';
import 'package:islami_app/taps/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;
  SuraItem({required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_number.png'),
            ),
          ),
          child: Text('${sura.numberofsura}', style: Theme.of(context).textTheme.titleLarge),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${sura.englishName}', style: Theme.of(context).textTheme.titleLarge),
            Text('${sura.ayahCount} verses', style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text('${sura.arabicName}', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
