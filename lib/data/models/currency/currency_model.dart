class CurrencyModel {
  String title;
  String code;
  String cbPrice;
  String nbuBuyPrice;
  String nbuCellPrice;
  String date;

  CurrencyModel({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      title: json['title'] as String? ?? "",
      code: json['code'] as String? ?? "",
      cbPrice: json['cb_price'] as String? ?? "",
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? "",
      nbuCellPrice: json['nbu_cell_price'] as String? ?? "",
      date: json['date'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "code": code,
      "cb_price": cbPrice,
      "nbu_buy_price": nbuBuyPrice,
      "nbu_cell_price": nbuCellPrice,
      "date": date,
    };
  }

  CurrencyModel copyWith({
    String? title,
    String? code,
    String? cbPrice,
    String? nbuBuyPrice,
    String? nbuCellPrice,
    String? date,
  }) {
    return CurrencyModel(
      title: title ?? this.title,
      code: code ?? this.code,
      cbPrice: cbPrice ?? this.cbPrice,
      nbuBuyPrice: nbuBuyPrice ?? this.nbuBuyPrice,
      nbuCellPrice: nbuCellPrice ?? this.nbuCellPrice,
      date: date ?? this.date,
    );
  }

  spotTheDifference({required CurrencyModel currencyModel}) {
    return code != currencyModel.code ||
        title != currencyModel.title ||
        cbPrice != currencyModel.cbPrice ||
        nbuBuyPrice != currencyModel.nbuBuyPrice ||
        nbuCellPrice != currencyModel.nbuCellPrice ||
        date != currencyModel.date;
  }
}
