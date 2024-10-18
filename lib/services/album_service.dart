import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/models/gps.dart';
import 'package:faker/faker.dart';

class AlbumService {
  static  List<Album> generateAlbums(int length) {
    List<Album> albums = (List<Album>.generate(length, (int counter) => Album(title: "Tintin au ${faker.address.country()}",
        numero: counter+1,
        year: int.tryParse(faker.date.year(minYear: 1950, maxYear: 2024)) ?? 2000,
        image: getRandomImage(),
        resume: faker.lorem.sentences(10).toString(),
        gps: GPS(latitude:Random().nextDouble()*100, longitude:Random().nextDouble()*100),
        location: faker.address.country()))
    );
    return albums;
  }

  static String getRandomImage() {
    List<String> filePaths = [
      'images/coke-en-stock.jpg',
      'images/l-affaire-tournesol.jpg',
      'images/l-etoile-mysterieuse.jpg',
      'images/l-ile-noire.jpg',
      'images/l-oreille-cassee.jpg',
      'images/le-crabe-aux-pinces-d-or.jpg',
      'images/le-lotus-bleu.jpg',
      'images/le-sceptre-d-ottokar.jpg',
      'images/le-secret-de-la-licorne.jpg',
      'images/le-temple-du-soleil.jpg',
      'images/le-tresor-de-rackham-le-rouge.jpg',
      'images/les-7-boules-de-cristal.jpg',
      'images/les-bijoux-de-la-castafiore.jpg',
      'images/les-cigares-du-pharaon.jpg',
      'images/objectif-lune.jpg',
      'images/on-a-marche-sur-la-lune.jpg',
      'images/tintin-au-congo.jpg',
      'images/tintin-au-pays-de-l-or-noir.jpg',
      'images/tintin-au-pays-des-soviets.jpg',
      'images/tintin-au-tibet.jpg',
      'images/tintin-en-amerique.jpg',
      'images/tintin-et-l-alph-art.jpg',
      'images/tintin-et-les-picaros.jpg',
      'images/vol-714-pour-sydney.jpg',
    ]; // merci Bing chat pour la liste générée automatiquement

    return filePaths[Random().nextInt(filePaths.length)];
  }

  static List<Album> parseAlbums(String jsonBody) {
    final List<dynamic> parsed = jsonDecode(jsonBody);
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }

  static Future<List<Album>> fetchAlbums() async  {
    final String jsonBody = await rootBundle.loadString('data/albums-tintin.json');

    return parseAlbums(jsonBody);
  }

}

