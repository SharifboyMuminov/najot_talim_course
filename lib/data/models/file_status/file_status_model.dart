class FileStatusModel {
  final bool isExist;
  final String newFileLocation;

  FileStatusModel({
    required this.newFileLocation,
    required this.isExist,
  });

  FileStatusModel copyWith({bool? isExist, String? newFileLocation}) =>
      FileStatusModel(
        newFileLocation: newFileLocation ?? this.newFileLocation,
        isExist: isExist ?? this.isExist,
      );
}
