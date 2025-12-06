import 'package:intl/intl.dart';
import 'package:islami_app/taps/time/pray_response_model/date.dart';
import 'package:islami_app/taps/time/pray_response_model/gregorian.dart';
import 'package:islami_app/taps/time/pray_response_model/hijri.dart';

class DataFormater {
  static String gregorianFormate(Gregorian gregorian) {
    return "${gregorian.day} ${gregorian.month!.en!.substring(0, 3)}, \n ${gregorian.year}";
  }

  static String hijriFormate(Hijri hijri) {
    return "${hijri.day} ${hijri.month!.en!.substring(0, 3)}, \n ${hijri.year}";
  }

  static timeFormate(String time) {
    DateTime dateTime = DateFormat("HH:mm").parse(time);
    return DateFormat("hh:mm \n a").format(dateTime);
  }

  static Map<String, dynamic> sortPrayerTime(Map<String, dynamic> prayerTime) {
    DateTime now = DateTime.now();
    // DateTime fakeDate = DateTime(now.year, now.month , now.day,now.hour+5 ,now.minute);
    var sortedEntries = prayerTime.entries.toList()
      ..sort((a, b) {
        DateTime aTime = DateFormat("HH:mm").parse(a.value);
        DateTime bTime = DateFormat("HH:mm").parse(b.value);
        DateTime dateTimeA = DateTime(
          now.year,
          now.month,
          now.day,
          aTime.hour,
          aTime.minute,
        );
        DateTime dateTimeB = DateTime(
          now.year,
          now.month,
          now.day,
          bTime.hour,
          bTime.minute,
        );
        if (dateTimeA.isBefore(now) || dateTimeA.isAtSameMomentAs(now)) {
          dateTimeA = dateTimeA.add(Duration(days: 1));
        }
        if (dateTimeB.isBefore(now) || dateTimeB.isAtSameMomentAs(now)) {
          dateTimeB = dateTimeB.add(Duration(days: 1));
        }
        return dateTimeA.compareTo(dateTimeB);
      });

    return Map<String, dynamic>.fromEntries(sortedEntries);
  }

  static getNextPrayerTimeCount(Map<String, dynamic> prayerTime) {
    Map<String, dynamic> timeDifferece = {};
    prayerTime.forEach((key, value) {
      DateTime now = DateTime.now();
      DateTime prayerTime = DateFormat("HH:mm").parse(value);
      DateTime prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        prayerTime.hour,
        prayerTime.minute,
      );
      if (prayerDateTime.isBefore(now) ||
          prayerDateTime.isAtSameMomentAs(now)) {
        prayerDateTime = prayerDateTime.add(Duration(days: 1));
      }
      Duration difference = prayerDateTime.difference(now);
      timeDifferece[key] = difference;
    });
    return timeDifferece;
  }
}
