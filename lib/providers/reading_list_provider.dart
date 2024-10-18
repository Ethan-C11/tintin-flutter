import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../models/album.dart';

class ReadingListProvider extends ChangeNotifier {
  final List<Album> _albums = [];

  UnmodifiableListView<Album> get albums => UnmodifiableListView(_albums);

  void addAlbum(Album album) {
    _albums.add(album);
    notifyListeners();
  }

  void removeAlbum(Album album) {
    _albums.removeAt(_albums.indexOf(album));
    notifyListeners();
  }

  Album getAlbumByNumero(int numeroToFind) {
    int index = _albums.indexWhere((album) {
      return album.numero == numeroToFind;
    });
    return _albums[index];
  }

  Album getAlbumByIndex(int index) {
    return _albums[index];
  }

  List<Album> getAlbums() {
    return _albums;
  }

}
