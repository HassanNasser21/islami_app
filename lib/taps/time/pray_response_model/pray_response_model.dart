import 'data.dart';

class PrayResponseModel {
  int? code;
  String? status;
  Data? data;

  PrayResponseModel({this.code, this.status, this.data});

  factory PrayResponseModel.fromJson(Map<String, dynamic> json) {
    return PrayResponseModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'data': data?.toJson(),
  };
}
