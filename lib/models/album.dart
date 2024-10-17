import 'dart:convert';
import 'package:flutter/services.dart';
import 'gps.dart';

class Album {
  String title;
  int numero;
  int year;
  String image;
  String resume;
  GPS gps;
  String location;

  int? yearInColor;

  Album(
      {required this.title,
      required this.numero,
      required this.year,
      required this.image,
      required this.resume,
      required this.gps,
      required this.location,
      this.yearInColor});

  String albumToString() {
    return ("Titre : $title\n"
        "Numero : $numero\n"
        "Année de sortie : $year\n"
        "Année de sortie en couleur : ${yearInColor ?? "Pas de sortie en couleur"}\n"
        "Image de couverture : $image\n"
        "Résumé : $resume\n"
        "Coordonnées GPS : lat ${gps.latitude}, long ${gps.longitude}\n"
        "Localisation de l'histoire : $location\n");
  }

  String albumToJson() {
    return jsonEncode(this);
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'] as String,
      numero: json['numero'] as int,
      year: json['year'] as int,
      image: json['image'] as String,
      resume: json['resume'] as String,
      gps: GPS.parseGPS(json['gps']),
      location: json['location'] as String,
      yearInColor: json['yearInColor'] as int,
    );
  }

  static List<Album> parseAlbums(String jsonBody) {
    final parsed = (jsonDecode(jsonBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }

}
