// import 'package:default_project/data/local/local_database/local_databas.dart';
// import 'package:default_project/data/moduls/notes/note.dart';
// import 'package:flutter/foundation.dart';
//
// class ConnectSql extends ChangeNotifier {
//   List<NoteModel> notes = [];
//   List<NoteModel> myData = [];
//
//   bool _loading = false;
//
//   bool get loading => _loading;
//
//   Future<void> getAllNote() async {
//     _notfire(true);
//     notes = await LocalDatabase.getAllNotes();
//     myData = notes;
//     _notfire(false);
//   }
//
//   Future<void> deleteNote({required NoteModel noteModel}) async {
//     if (noteModel.id != null) {
//       _notfire(true);
//       await LocalDatabase.deleteNotes(noteModel.id!);
//       getAllNote();
//       _notfire(false);
//     }
//   }
//
//   Future<void> insertNote({required NoteModel noteModel}) async {
//     _notfire(true);
//     await LocalDatabase.insertNotes(noteModel);
//     getAllNote();
//     _notfire(false);
//   }
//
//   Future<void> updateNote({required NoteModel noteModel}) async {
//     _notfire(true);
//     await LocalDatabase.updateNotes(noteModel: noteModel);
//     getAllNote();
//     _notfire(false);
//   }
//
//   searchNotes(String fullname) {
//     _notfire(true);
//
//     if (fullname.isNotEmpty) {
//       notes =
//           myData.where((element) => element.fullname.contains(fullname)).toList();
//     } else {
//       notes = myData;
//     }
//     _notfire(false);
//   }
//
//   _notfire(bool v) {
//     _loading = v;
//     notifyListeners();
//   }
// }
