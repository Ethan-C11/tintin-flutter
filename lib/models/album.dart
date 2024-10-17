import 'dart:convert';
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

   Album({required this.title, required this.numero, required this.year, required this.image, required this.resume, required this.gps, required this.location, this.yearInColor});

  String albumToString(){
    return("Titre : $title\n"
        "Numero : $numero\n"
        "Année de sortie : $year\n"
        "Année de sortie en couleur : ${yearInColor ?? "Pas de sortie en couleur"}\n"
        "Image de couverture : $image\n"
        "Résumé : $resume\n"
        "Coordonnées GPS : lat ${gps.getLatitude()}, long ${gps.getLongitude()}\n"
        "Localisation de l'histoire : $location\n"
    );
  }

  String albumToJson(){
    return jsonEncode(this);
  }
}