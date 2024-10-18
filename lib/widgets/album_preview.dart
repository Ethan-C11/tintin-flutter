import 'package:tintin/models/album.dart';
import 'package:flutter/material.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  final int albumIndex;
  final Function onTap;

  const AlbumPreview({super.key, required this.album, required this.onTap, required this.albumIndex});

  @override
  Widget build(BuildContext context) {
  return ListTile(
      leading: Image.asset("images/${album.image}"),
      title: Text(album.title),
      textColor: Theme.of(context).colorScheme.inverseSurface,
      tileColor: const Color.fromARGB(75, 50, 50, 50),
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      onTap: () => onTap(albumIndex),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}
}