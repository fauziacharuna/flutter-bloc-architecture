import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_tutorial/models/album_list.dart';
import 'package:flutter_app_bloc_tutorial/bloc/events.dart';
import 'package:flutter_app_bloc_tutorial/bloc/states.dart';
import 'package:flutter_app_bloc_tutorial/bloc/albums_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app_bloc_tutorial/widgets/error.dart';
import 'package:flutter_app_bloc_tutorial/widgets/loading.dart';
import 'package:flutter_app_bloc_tutorial/widgets/list_row.dart';
import 'package:flutter_app_bloc_tutorial/bloc/events.dart';





class AlbumsScreen extends StatefulWidget{
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }
  _loadAlbums() async {
    context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
              if (state is AlbumsListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return ErrorTxt(
                  message: message,
                  onTap: _loadAlbums,
                );
              }
              if (state is AlbumsLoaded) {
                List<Album> albums = state.albums;
                return _list(albums);
              }
              return Loading();
            }),
      ],
    );
  }
  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(album: album);
        },
      ),
    );
  }
}


