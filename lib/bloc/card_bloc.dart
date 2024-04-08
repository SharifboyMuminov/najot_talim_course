import 'package:default_project/bloc/card_event.dart';
import 'package:default_project/bloc/card_state.dart';
import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:default_project/data/models/my_respons/my_respons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  ApiProvider apiProvider;

  CardBloc({required this.apiProvider}) : super(LoadingState()) {
    on<CallCardEvent>(_callProducts);
    on<SolveCardEvent>(_solveCard);
    on<InsertCardEvent>(_insertProducts);
    on<DeleteCardEvent>(_deleteProducts);
  }

  _callProducts(CallCardEvent callProduct, Emitter<CardState> emit) async {
    emit(LoadingState());
    MyResponse myResponse = await apiProvider.callCards();
    if (myResponse.errorText.isNotEmpty) {
      emit(ErrorState(errorText: "Error :("));
    } else {
      emit(OkState(cards: myResponse.data));
    }
  }

  _insertProducts(
      InsertCardEvent insertCardEvent, Emitter<CardState> emit) async {
    emit(LoadingState());
    MyResponse myResponse =
        await apiProvider.insertCards(cardModel: insertCardEvent.cardModel);
    if (myResponse.errorText.isNotEmpty) {
      emit(ErrorState(errorText: "Error :("));
    } else {
      add(CallCardEvent());
    }
  }

  _deleteProducts(
      DeleteCardEvent deleteCardEvent, Emitter<CardState> emit) async {
    emit(LoadingState());
    MyResponse myResponse =
        await apiProvider.deleteCards(cardModel: deleteCardEvent.cardModel);
    if (myResponse.errorText.isNotEmpty) {
      emit(ErrorState(errorText: "Error :("));
    } else {
      add(CallCardEvent());
    }
  }

  _solveCard(SolveCardEvent solveCardEvent, Emitter<CardState> emit) async {
    // solveCardEvent.cardModelOn = solveCardEvent.cardModelOn.copyWith(
    //     amount: solveCardEvent.cardModelOn.amount - solveCardEvent.money);
    // solveCardEvent.cardModelTo = solveCardEvent.cardModelTo.copyWith(
    //     amount: solveCardEvent.cardModelTo.amount + solveCardEvent.money);

    MyResponse myResponse = await apiProvider.updateCards(cardModel: [
      solveCardEvent.cardModelOn.copyWith(
          amount: solveCardEvent.cardModelOn.amount - solveCardEvent.money),
      solveCardEvent.cardModelTo.copyWith(
          amount: solveCardEvent.cardModelTo.amount + solveCardEvent.money)
    ]);

    if (myResponse.errorText.isNotEmpty) {
      emit(ErrorState(errorText: "Error :("));
    } else {
      add(CallCardEvent());
    }
  }
}
