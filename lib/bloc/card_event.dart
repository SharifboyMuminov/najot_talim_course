import 'package:default_project/data/models/card/card_model.dart';

abstract class CardEvent {}

class CallCardEvent extends CardEvent {}

class InsertCardEvent extends CardEvent {
  CardModel cardModel;

  InsertCardEvent({required this.cardModel});
}

class DeleteCardEvent extends CardEvent {
  CardModel cardModel;

  DeleteCardEvent({required this.cardModel});
}

class SolveCardEvent extends CardEvent {
  CardModel cardModelOn;
  CardModel cardModelTo;
  double money;

  SolveCardEvent(
      {required this.cardModelOn,
      required this.cardModelTo,
      required this.money});
}
