import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/views/onboarding_data_class.dart';
import 'package:islami_app/views/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbardingScreen extends StatefulWidget {
  static const String routeName = '/onbarding-screen';

  OnbardingScreen({super.key});

  @override
  State<OnbardingScreen> createState() => _OnbardingScreenState();
}

class _OnbardingScreenState extends State<OnbardingScreen> {
  final controller = PageController();
  int count = 5;
  int currentIndex = 0;
  final List<OnboardingDataClass> pages = [
    OnboardingDataClass(
      image: 'onboarding_1',
      title: 'Welcome To Islmi App',
      description: ' ',
    ),
    OnboardingDataClass(
      image: 'onboarding_2',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingDataClass(
      image: 'onboarding_3',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingDataClass(
      image: 'onboarding_4',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingDataClass(
      image: 'onboarding_5',
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppTheme.black),
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * 0.15,
              fit: BoxFit.fitWidth,
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: controller,
                itemCount: count,
                itemBuilder: (context, index) =>
                    OnboardingItem(page: pages[index]),
              ),
            ),
            //     OnboardingItem(page: pages[0]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentIndex == 0
                    ? const SizedBox(width: 20)
                    : TextButton(
                        onPressed: () {
                          controller.animateToPage(
                            currentIndex - 1,
                            duration: Durations.long1,
                            curve: Curves.linear,
                          );

                          setState(() {
                            currentIndex--;
                          });
                        },
                        child: Text(
                          currentIndex == 0 ? '' : 'Back',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: AppTheme.primaryColor),
                        ),
                      ),
                SmoothPageIndicator(
                  controller: controller,
                  count: count,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppTheme.primaryColor,
                    dotColor: Color(0xff707070),
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 10,
                  ),
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: Durations.long1,
                    curve: Curves.linear,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (currentIndex < pages.length - 1) {
                      controller.animateToPage(
                        currentIndex + 1,
                        duration: Durations.long1,
                        curve: Curves.linear,
                      );
                      setState(() {
                        currentIndex++;
                      });
                    }else{
                      _onFinishPressed();
                    }
                  },
                  child: Text(
                    currentIndex == pages.length - 1 ? 'Finish' : 'Next',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
void _onFinishPressed() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_completed', true);

  // Navigate to home or login screen
  Navigator.pushReplacementNamed(context, '/home'); // Replace with your actual route
}
}




