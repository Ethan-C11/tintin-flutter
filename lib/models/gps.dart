import 'dart:convert';
import 'package:flutter/services.dart';

class GPS {
  late double latitude;
  late double longitude;

  GPS({required this.latitude, required this.longitude});

  factory GPS.fromJson(Map<String, dynamic> json) {
    return GPS(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  static GPS parseGPS(String jsonBody) {
    return (jsonDecode(jsonBody) as GPS);
  }
}