class Sender {
  String brandImage;
  String name;
  String location;

  Sender({
    required this.brandImage,
    required this.name,
    required this.location,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      brandImage: json['brand_image'] as String? ?? "",
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? "",
    );
  }


}
