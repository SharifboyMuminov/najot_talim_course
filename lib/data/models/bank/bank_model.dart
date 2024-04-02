import 'package:default_project/data/models/sender/sender_model.dart';

class BankModel {
  int transactionCode;
  DateTime date;
  int incomeId;
  double amount;
  int cardId;
  Sender sender;

  BankModel({
    required this.sender,
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: DateTime.parse(json['date'] as String? ?? ""),
      incomeId: json['income_id'] as int? ?? 0,
      amount: (json['amount'] as num? ?? 0.0).toDouble(),
      cardId: json['card_id'] as int? ?? 0,
      sender: Sender.fromJson(json["sender"]),
    );
  }
}
