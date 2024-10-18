import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
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
   List<Album> _albums = [];

  late String _title;

  Future<void> _fetchAlbums() async{

    try{
      final result = await AlbumService.fetchAlbums();
      setState(() {
        _albums = result;
      });
    }catch(e){
      print(e);
    }



  }

  @override
  void initState() {
    _title = widget.title;

    _fetchAlbums();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onButtonClicked(int albumIndex) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AlbumDetails(
                  album: _albums[albumIndex], albumIndex: albumIndex)));
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
            itemCount: _albums.length,
            itemBuilder: (context, index) {
              return AlbumPreview(
                  album: _albums[index],
                  onTap: onButtonClicked,
                  albumIndex: index);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                )),
      ),
    );
  }
}
