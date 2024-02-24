class CloudsModul {
  final int all;

  CloudsModul({required this.all});

  factory CloudsModul.fromJson(Map<String, dynamic> json) {
    return CloudsModul(all: json["all"] as int? ?? 0);
  }
}
