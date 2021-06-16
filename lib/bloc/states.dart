import 'package:equatable/equatable.dart';
import '../models/album_list.dart';

//State
//1. AlbumInitState
//2. AlbumLoading
//3. AlbumIsLoaded
//4. AlbumListError

abstract class AlbumsState extends Equatable {
  List<Object> get props => [];


}
class AlbumsInitState extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final List<Album> albums;

  AlbumsLoaded({
    required this.albums
  });
}

class AlbumsListError extends AlbumsState {
  final error;
  AlbumsListError({this.error});
}