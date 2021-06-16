import 'dart:io';

import 'package:flutter_app_bloc_tutorial/api/exceptions.dart';
import 'package:flutter_app_bloc_tutorial/api/services.dart';
import 'package:flutter_app_bloc_tutorial/bloc/states.dart';
import 'package:flutter_app_bloc_tutorial/models/album_list.dart';
import 'package:flutter_app_bloc_tutorial/bloc/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  //
  late final AlbumsRepo albumsRepo;
  late List<Album> albums;

  AlbumsBloc({required this.albumsRepo}) : super(AlbumsInitState());

  @override
  Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }
}