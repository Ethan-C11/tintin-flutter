import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../models/album.dart';

class AlbumProvider extends ChangeNotifier {
  List<Album> _albums = [];
  List<Album> _readingList = [];

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

  void setAlbums(List<Album> albums) {
    _albums = albums;
    notifyListeners();
  }

  void addToReadingList(Album album) {
    _readingList.add(album);
    notifyListeners();
  }

  void removeFromReadingList(Album album) {
    _readingList.removeAt(_albums.indexOf(album));
    notifyListeners();
  }

  Album getAlbumByNumeroFromReadingList(int numeroToFind) {
    int index = _readingList.indexWhere((album) {
      return album.numero == numeroToFind;
    });
    return _readingList[index];
  }

  Album getAlbumByIndexFromReadingList(int index) {
    return _readingList[index];
  }

  List<Album> getReadingList() {
    return _readingList;
  }

  void setReadingList(List<Album> readingList) {
    _readingList = readingList;
    notifyListeners();
  }

}
