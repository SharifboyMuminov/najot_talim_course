class UserModel {
  String imageUrl;
  String storegiPath;
  String password;
  String fullName;
  String docId;

  UserModel({
    required this.imageUrl,
    required this.docId,
    required this.fullName,
    required this.storegiPath,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      imageUrl: json["image_url"] as String? ?? "",
      docId: json["doc_id"] as String? ?? "",
      fullName: json["full_name"] as String? ?? "",
      storegiPath: json["storegi_path"] as String? ?? "",
      password: json['password'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "password": password,
      "image_url": imageUrl,
      "doc_id": docId,
      "full_name": fullName,
      "storegi_path": storegiPath
    };
  }

  UserModel copyWith({
    String? password,
    String? imageUrl,
    String? docId,
    String? fullName,
    String? storegiPath,
  }) {
    return UserModel(
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      docId: docId ?? this.docId,
      fullName: fullName ?? this.fullName,
      storegiPath: storegiPath ?? this.storegiPath,
    );
  }
}
