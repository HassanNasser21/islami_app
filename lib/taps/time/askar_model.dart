import 'dart:convert';

import 'package:flutter/services.dart';

class AskarModel {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;

  AskarModel({
    this.category,
    this.count,
    this.description,
    this.reference,
    this.content,
  });

  factory AskarModel.fromJson(Map<String, dynamic> json) => AskarModel(
    category: json['category'] as String?,
    count: json['count'] as String?,
    description: json['description'] as String?,
    reference: json['reference'] as String?,
    content: json['content'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'category': category,
    'count': count,
    'description': description,
    'reference': reference,
    'content': content,
  };

  static Future<List<AskarModel>> getAskar(String azkarType) async {
    var jsonContent = jsonDecode(
      await rootBundle.loadString('assets/text/azkar.json'),
    );
    if (jsonContent[azkarType] is List) {
      return (jsonContent[azkarType] as List)
          .map((e) => AskarModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
