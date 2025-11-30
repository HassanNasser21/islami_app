import 'radio.dart';

class RadioResponseModel {
  List<Radio>? radios;

  RadioResponseModel({this.radios});

  factory RadioResponseModel.fromJson(Map<String, dynamic> json) {
    return RadioResponseModel(
      radios: (json['radios'] as List<dynamic>?)
          ?.map((e) => Radio.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'radios': radios?.map((e) => e.toJson()).toList(),
  };
}
