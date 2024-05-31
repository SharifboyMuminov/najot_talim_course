import 'package:default_project/data/enums/form_status/formS_status.dart';
import 'package:default_project/data/models/favorite/favorite_model.dart';

class FavoriteState {
  final String errorText;
  final String statusMessage;
  final FormsStatus formsStatus;
  final List<FavoriteModel> favoriteModels;

  FavoriteState({
    required this.formsStatus,
    required this.errorText,
    required this.statusMessage,
    required this.favoriteModels,
  });

  FavoriteState copyWith({
    String? errorText,
    String? statusMessage,
    List<FavoriteModel>? favoriteModels,
    FormsStatus? formsStatus,
  }) =>
      FavoriteState(
        errorText: errorText ?? this.errorText,
        statusMessage: statusMessage ?? this.statusMessage,
        favoriteModels: favoriteModels ?? this.favoriteModels,
        formsStatus: formsStatus ?? this.formsStatus,
      );
}
