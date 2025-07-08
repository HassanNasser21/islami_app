import 'package:flutter/material.dart';
import 'package:islami_app/nav_bar_unselected.dart';
import 'package:islami_app/selected_nav_bar.dart';
import 'package:islami_app/taps/hadeth_tap.dart';
import 'package:islami_app/taps/quran/quran_tap.dart';
import 'package:islami_app/taps/radio/radio_tap.dart';
import 'package:islami_app/taps/sebha_tap.dart';
import 'package:islami_app/taps/time_tap.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];
  List<String> backgroundImageNames = [
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/${backgroundImageNames[currentIndex]}.png',
            ), // provider the image for the widget(that show the image)
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/header.png',
                height: MediaQuery.sizeOf(context).height * 0.15,
                fit: BoxFit.fitWidth,
              ), //that show the image ,cause it widget not provider like borderRaidius.circular
              Expanded(child: screens[currentIndex]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == currentIndex) return;
          currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'quran'),
            activeIcon: SelectedNavBar(imagename: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'hadeth'),
            activeIcon: SelectedNavBar(imagename: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'sebha'),
            activeIcon: SelectedNavBar(imagename: 'sebha'),
            label: 'Sebha',
          ),

          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'radio'),
            activeIcon: SelectedNavBar(imagename: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselected(imagename: 'time'),
            activeIcon: SelectedNavBar(imagename: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
