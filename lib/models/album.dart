import 'dart:convert';

import 'gps.dart';

class album {
  late String _title;
  late int _numero;
  late int _year;
  late String _image;
  late String _resume;
  late GPS _gps;
  late String _location;

  late int? _yearInColor;

  album.name(String title, int numero, int year, String image, String resume, GPS gps, String location, [int? yearInColor]) {
    _title = title;
    _numero = numero;
    _year = year;
    _image = image;
    _resume = resume;
    _gps = gps;
    _location = location;
    _yearInColor = yearInColor;
  }

  String albumToString(){
    return("Titre : $_title\n"
        "Numero : $_numero\n"
        "Année de sortie : $_year\n"
        "Année de sortie en couleur : ${_yearInColor ?? "Pas de sortie en couleur"}\n"
        "Image de couverture : $_image\n"
        "Résumé : $_resume\n"
        "Coordonnées GPS : lat ${_gps.getLatitude()}, long ${_gps.getLongitude()}\n"
        "Localisation de l'histoire : $_location\n"
    );
  }

  String albumToJson(){
    return jsonEncode(this);
  }

}