import 'package:default_project/data/models/favorite/favorite_model.dart';

abstract class FavoriteEvent {}

class FavoriteCallEvent extends FavoriteEvent {}

class FavoriteInsertEvent extends FavoriteEvent {
  final FavoriteModel favoriteModel;

  FavoriteInsertEvent({required this.favoriteModel});
}

class FavoriteDeleteEvent extends FavoriteEvent {
  final FavoriteModel favoriteModel;

  FavoriteDeleteEvent({required this.favoriteModel});
}
