class UserModel {
  final String tokenId;
  final String docId;
  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.docId,
    required this.password,
    required this.tokenId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"] as String? ?? "",
      docId: json["doc_id"] as String? ?? "",
      password: json["password"] as String? ?? "",
      tokenId: json["token_id"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'doc_id': "",
      'password': password,
      'token_id': tokenId,
    };
  }
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'email': email,
      'password': password,
      'token_id': tokenId,
    };
  }
}