import 'dart:math';
import 'package:tintin/models/album.dart';
import 'package:tintin/models/gps.dart';
import 'package:faker/faker.dart';

class AlbumService {
  static  Future<List<album>> generateAlbums(int length) async {
    String pays = faker.address.country();
    return List<album>.generate(length, (int counter) => album(title: "Tintin  au $pays",
        numero: counter,
        year: faker.date.year as int,
        image: faker.image.loremPicsum(),
        resume: faker.lorem.sentence(),
        gps: new GPS(Random().nextDouble()*100, Random().nextDouble()*100),
        location: pays)
    );
  }
}