import 'package:default_project/blocs/favorite/favorite_event.dart';
import 'package:default_project/blocs/favorite/favorite_state.dart';
import 'package:default_project/data/enums/form_status/formS_status.dart';
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
        ) {}
}
