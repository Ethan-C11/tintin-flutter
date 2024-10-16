import 'package:tintin/models/album.dart';

class AlbumService {
  static  Future<List<album>> generateAlbums(int length) async {
    return List<album>.generate(length, (int counter) => album.newAlbum(title, numero: counter, year, image, resume, gps, location));
  }
}