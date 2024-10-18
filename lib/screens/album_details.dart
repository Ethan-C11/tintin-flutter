import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  final int albumIndex;
  final Function addOrRemoveFromReadingList;

  const AlbumDetails(
      {super.key, required this.album, required this.albumIndex, required this.addOrRemoveFromReadingList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          foregroundColor: Theme
              .of(context)
              .colorScheme
              .surface,
          title: Text(album.title),
          centerTitle: true,
        ),
        body: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Album n°$albumIndex', textAlign: TextAlign.center),
                      Text(
                        'Résumé : ${album.resume}',
                        textAlign: TextAlign.left,
                      ),
                      Text('Année de parution : ${album.year}',
                          textAlign: TextAlign.center),
                      Builder(builder: (context) {
                        if (album.yearInColor != null) {
                          return Text(
                              'Année de parution en couleur : ${album
                                  .yearInColor}');
                        }
                        return const Text('');
                      }),
                      Text('Numéro : ${album.numero}',
                          textAlign: TextAlign.center),
                      Image.asset(
                        "images/${album.image}",
                        height: 350,
                        alignment: Alignment.center,
                      )
                    ],
                  )),
            )),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {addOrRemoveFromReadingList(albumIndex)},
            tooltip: 'Ajouter à la liste de lecture',
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            foregroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(Icons.book_rounded)
        )
    );
  }
}
