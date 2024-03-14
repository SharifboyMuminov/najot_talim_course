class StateGerbModel {
  final String png;
  final String svg;

  StateGerbModel({
    required this.png,
    required this.svg,
  });

  factory StateGerbModel.fromJson(Map<String, dynamic> json) {
    return StateGerbModel(
      png: json['png'] as String? ?? "",
      svg: json['svg'] as String? ?? "",
    );
  }
}
