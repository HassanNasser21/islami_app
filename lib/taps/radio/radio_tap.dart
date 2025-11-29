import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/radio/build_radio_content.dart';
import 'package:islami_app/taps/radio/build_reciters_content.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  bool isRadioSelected = true;

  @override
  Widget build(BuildContext context) {
    final double halfWidth = MediaQuery.of(context).size.width * 0.45;

    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppTheme.primaryColor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.black,
                ),
                tabs: [
                  Tab(text: 'Radio'),
                  Tab(text: 'Reciters'),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: TabBarView(
                children: [BuildRadioContent(), BuildRecitersContent()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
