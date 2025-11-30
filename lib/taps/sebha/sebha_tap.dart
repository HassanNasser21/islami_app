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
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenSize.height * 0.02),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          SizedBox(height: screenSize.height * 0.02),
          Image.asset('assets/images/SebhaTail.png', height: 85, width: 145),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: onClicked,
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset('assets/images/SebhaBody.png'),
                ),
              ),

              SizedBox(
                width: screenSize.width * 0.6,
                child: Column(
                  children: [
                    Text(
                      ' ${azkar[index]}',
                      style: Theme.of(context).textTheme.displaySmall,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '$askarcount',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onClicked() {
    askarcount++;
    angle += 20;
    if (askarcount % 33 == 0) {
      index++;
    }
    if (index == azkar.length) {
      index = 0;
      askarcount = 0;
    }
    setState(() {});
  }
}
