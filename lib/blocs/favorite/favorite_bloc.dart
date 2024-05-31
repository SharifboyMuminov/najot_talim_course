import 'package:default_project/blocs/favorite/favorite_event.dart';
import 'package:default_project/blocs/favorite/favorite_state.dart';
import 'package:default_project/data/enums/form_status/formS_status.dart';
import 'package:default_project/data/local/local_database.dart';
import 'package:default_project/data/models/favorite/favorite_model.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc()
      : super(
          FavoriteState(
            errorText: '',
            statusMessage: '',
            favoriteModels: [],
            formsStatus: FormsStatus.pure,
          ),
        ) {
    on<FavoriteCallEvent>(_favoriteCall);
    on<FavoriteInsertEvent>(_favoriteInsert);
    on<FavoriteDeleteEvent>(_favoriteDelete);
  }

  Future<void> _favoriteCall(FavoriteCallEvent event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await LocalDatabase.getAllFavorites();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          favoriteModels: networkResponse.data,
        ),
      );
    } else {
      // debugPrint("---------- ${networkResponse.errorText}");
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  _favoriteDelete(FavoriteDeleteEvent event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse =
        await LocalDatabase.deleteFavorite(event.favoriteModel.id);

    if (networkResponse.errorText.isEmpty) {
      List<FavoriteModel> favorites = state.favoriteModels;
      favorites.remove(event.favoriteModel);
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          favoriteModels: favorites,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  _favoriteInsert(FavoriteInsertEvent event, emit) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse =
        await LocalDatabase.insertFavorite(event.favoriteModel);

    if (networkResponse.errorText.isEmpty) {
      List<FavoriteModel> favorites = state.favoriteModels;
      favorites.add(event.favoriteModel);
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          favoriteModels: favorites,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
