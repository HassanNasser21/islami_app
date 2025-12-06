import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/taps/time/azkar_screen_details.dart';
import 'package:islami_app/taps/time/data_formater.dart';
import 'package:islami_app/taps/time/next_prayer_time.dart';
import 'package:islami_app/taps/time/pray_response_model/pray_response_model.dart';
import 'package:islami_app/taps/time/time_api_service.dart';
import 'package:islami_app/widgets/loading_indicator.dart';

class TimeTap extends StatelessWidget {
  const TimeTap({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.3,
            child: FutureBuilder<PrayResponseModel>(
              future: TimeApiService.getPray(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(child: LoadingIndicator());
                } else if (snapshot.hasError) {
                  log("Error: ${snapshot.error}");

                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  );
                } else if (!snapshot.hasData && snapshot.data == null) {
                  return Center(
                    child: Text(
                      "No data available",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  );
                }
                PrayResponseModel data = snapshot.data!;
                Map<String, dynamic> prayerTimes =
                    DataFormater.sortPrayerTime(data.data!.timings!.toJson());
              Map<String, dynamic> nextPrayerTimeCount = DataFormater.getNextPrayerTimeCount(prayerTimes);
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppTheme.brown,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/prayer_background.png'),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 10,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              DataFormater.gregorianFormate(
                                data.data!.date!.gregorian!,
                              ),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Column(
                              children: [
                                AutoSizeText(
                                  "Prayer Times",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: AppTheme.black.withAlpha(200),
                                      ),
                                ),
                                AutoSizeText(
                                  data.data!.date!.gregorian!.weekday!.en!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: AppTheme.black),
                                ),
                              ],
                            ),
                            AutoSizeText(
                              DataFormater.hijriFormate(
                                data.data!.date!.hijri!,
                              ),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 78),
                          CarouselSlider.builder(
                            itemCount: prayerTimes.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [AppTheme.gold, AppTheme.black],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    right: 12.0,
                                    left: 12.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        prayerTimes.keys.elementAt(index).toString(),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleLarge,
                                      ),
                                      SizedBox(height: 8),
                                      Flexible(
                                        child: Text(
                                          DataFormater.timeFormate(
                                            prayerTimes.values.elementAt(index),
                                          ),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: size.height * 0.15,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.2,
                              viewportFraction: 0.25,
                            ),
                          ),
                          NextPrayerTime(timeRemaining: nextPrayerTimeCount[prayerTimes.keys.first]!),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text('Azkar', style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.black,
                  border: Border.all(color: AppTheme.primaryColor),
                ),
                width: size.width * 0.42,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/evening_azkar.png'),
                    Text(
                      'Evening Azkar',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AzkarScreenDetails.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.black,
                    border: Border.all(color: AppTheme.primaryColor),
                  ),
                  width: size.width * 0.42,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/morning_azkar.png'),
                      Text(
                        'Morning Azkar',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
