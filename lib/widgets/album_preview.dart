import 'package:tintin/models/album.dart';
import 'package:flutter/material.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  final int albumIndex;
  final Function onTap;
  final Function isInReadingList;

  const AlbumPreview({super.key, required this.album, required this.onTap, required this.albumIndex, required this.isInReadingList});

  @override
  Widget build(BuildContext context) {

    Color colorFromReadingList(int index) {
      if(isInReadingList(index)) {
        return const Color.fromARGB(125, 150, 150, 150);
      } else {
        return const Color.fromARGB(75, 50, 50, 50);
      }
    }

  return ListTile(
      leading: Image.asset("images/${album.image}"),
      title: Text(album.title),
      textColor: Theme.of(context).colorScheme.inverseSurface,
      tileColor: colorFromReadingList(albumIndex),
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      onTap: () => onTap(albumIndex),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}
}