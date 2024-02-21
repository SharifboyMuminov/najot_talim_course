class GameModul {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  GameModul({
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.developer,
    required this.freetogameProfileUrl,
    required this.gameUrl,
    required this.genre,
    required this.id,
    required this.platform,
    required this.publisher,
    required this.releaseDate,
  });

  factory GameModul.fromJson(Map<String, dynamic> json) {
    return GameModul(
        title: json["title"] as String? ?? "",
        thumbnail: json["thumbnail"] as String? ?? "",
        shortDescription: json["short_description"] as String? ?? "",
        developer: json["developer"] as String? ?? "",
        freetogameProfileUrl: json["freetogame_profile_url"] as String? ?? "",
        gameUrl: json["game_url"] as String? ?? "",
        genre: json["genre"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        platform: json["platform"] as String? ?? "",
        publisher: json["publisher"] as String? ?? "",
        releaseDate: json["release_date"] as String? ?? "");
  }
}

