import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_app/taps/time/pray_response_model/pray_response_model.dart';

class TimeApiService {
  static Future<PrayResponseModel> getPray() async {
    var date = DateFormat("dd-MM-yyyy").format(DateTime.now());
    try {
      Uri uri = Uri.parse(
        "https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt",
      );
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return PrayResponseModel.fromJson(jsonResponse);
      } else {
        var errorResponse = jsonDecode(response.body);
        throw Exception(errorResponse.toString());
      }
    } catch (e) {
      throw Exception("faild to fetch prayer times : $e");
    }
  }
}
