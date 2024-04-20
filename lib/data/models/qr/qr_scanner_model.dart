class QrScannerModel {
  final String qrCode;
  final String name;
  final String date;
  int? id;

  QrScannerModel({
    required this.date,
    required this.qrCode,
    required this.name,
    this.id,
  });

  factory QrScannerModel.fromJson(Map<String, dynamic> json) {
    return QrScannerModel(
      qrCode: json["qr_code"] as String? ?? "",
      name: json["name"] as String? ?? "",
      id: json["id"],
      date: json["date"] as String? ?? "11/11/2002",
    );
  }

  QrScannerModel copyWith({
    String? qrCode,
    String? name,
    int? id,
    String? date,
  }) {
    return QrScannerModel(
      qrCode: qrCode ?? this.qrCode,
      name: name ?? this.name,
      id: id ?? this.id,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "qr_code": qrCode,
      "name": name,
      "date": date,
    };
  }
}
