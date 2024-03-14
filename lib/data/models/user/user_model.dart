class UserModel {
  int id;
  String username;
  String name;
  String state;
  String avatarUrl;

  UserModel(
      {required this.id,
      required this.username,
      required this.name,
      required this.state,
      required this.avatarUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      state: json['state'],
      avatarUrl: json['avatar_url'],
    );
  }
}
