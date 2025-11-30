import 'reciter.dart';

class RadioRecitersModel {
  List<Reciter>? reciters;

  RadioRecitersModel({this.reciters});

  factory RadioRecitersModel.fromJson(Map<String, dynamic> json) {
    return RadioRecitersModel(
      reciters: (json['reciters'] as List<dynamic>?)
          ?.map((e) => Reciter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'reciters': reciters?.map((e) => e.toJson()).toList(),
  };
}
