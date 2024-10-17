import 'dart:convert';

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

  static GPS parseGPS(String body) {
    return GPS(latitude: double.parse(body.split(',')[0]), longitude: double.parse(body.split(',')[1]));
  }
}