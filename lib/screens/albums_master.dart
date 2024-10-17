import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import '../services/album_service.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({super.key, required this.title});

  final String title;

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  List<Album> _albums = [];

  late String _title;

  @override
  void initState() {
    _title = widget.title;
    _albums = AlbumService.generateAlbums(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onButtonClicked() {}

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: Text(_title, textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            itemCount: _albums.length,
            itemBuilder: (context, index) {
              Album album = _albums[index];
              return ListTile(
                  leading: Image.asset(album.image),
                  title: Text(album.title),
                  textColor: Theme.of(context).colorScheme.inverseSurface,
                  tileColor: const Color.fromARGB(75, 50, 50, 50),
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  onTap: () => onButtonClicked(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ));
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                )),
      ),
    );
  }
}
