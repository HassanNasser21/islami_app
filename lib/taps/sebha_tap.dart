import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SebhaTap extends StatefulWidget {
  SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله اكبر',
  ];

  int askarcount = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        InkWell(
          onTap: () {
            askarcount++;
            if (askarcount == 33) {
              index++;
              askarcount = 0;
            }
            if (index > 3) {
              index = 0;
            }
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Container(
              alignment: Alignment.center,
              height: 460,
              // margin: const EdgeInsets.symmetric(horizontal: 26),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Sebha.png'),
                  // fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    '${azkar[index]}',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '$askarcount',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
