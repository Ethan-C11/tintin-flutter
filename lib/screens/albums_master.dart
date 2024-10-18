import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/album_details.dart';
import 'package:tintin/widgets/album_preview.dart';
import '../services/album_service.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({super.key, required this.title});

  final String title;

  @override
  State<AlbumsMaster> createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  final AlbumProvider _readingListProvider = AlbumProvider();

  late String _title;

  Future<void> _fetchAlbums() async {
    try {
      final result = await AlbumService.fetchAlbums();
      setState(() {
        _readingListProvider.setAlbums(result);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _title = widget.title;

    _fetchAlbums();

    super.initState();
  }

  void addOrRemoveFromReadingList(int index) {

    Album album = _readingListProvider.getAlbumByIndex(index);
    int indexOfAlbum = _readingListProvider.getReadingList().indexOf(album);
    if (indexOfAlbum == -1) {
      setState(() {
        _readingListProvider.addToReadingList(album);
      });
    } else {
      setState(() {
        _readingListProvider.removeFromReadingList(album);
      });
    }
  }

  bool isInReadingList(int index) {
    Album album = _readingListProvider.getAlbumByIndex(index);
    int indexOfAlbum = _readingListProvider.getReadingList().indexOf(album);
    if (indexOfAlbum == -1) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    onButtonClicked(int albumIndex) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AlbumDetails(
                    album: _readingListProvider.getAlbumByIndex(albumIndex),
                    albumIndex: albumIndex,
                    addOrRemoveFromReadingList: addOrRemoveFromReadingList,
                  )));
    }

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
            itemCount: _readingListProvider.getAlbums().length,
            itemBuilder: (context, index) {
              return AlbumPreview(
                album: _readingListProvider.getAlbumByIndex(index),
                onTap: onButtonClicked,
                albumIndex: index,
                isInReadingList: isInReadingList,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                )),
      ),
    );
  }
}
