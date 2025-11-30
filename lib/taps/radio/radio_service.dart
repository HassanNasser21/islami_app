import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/taps/radio/radio_reciters_model/radio_reciters_model.dart';
import 'package:islami_app/taps/radio/radio_response_model/radio_response_model.dart';

class RadioService {
  static Future<RadioResponseModel> GetRadioData() async {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioResponseModel.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }
   static Future<RadioRecitersModel> GetRecitersData() async {
    try {
      Uri uri = Uri.parse("https://www.mp3quran.net/api/v3/reciters?language=ar");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioRecitersModel.fromJson(jsonResponse);
    } catch (e) {
      rethrow;
    }
  }
}
