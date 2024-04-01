import 'package:default_project/data/local/local_database/local_databas.dart';
import 'package:default_project/data/moduls/note.dart';
import 'package:flutter/foundation.dart';

class ConnectSql extends ChangeNotifier {
  List<NoteModel> notes = [];

  bool _loading = false;

  bool get loading => _loading;

  Future<void> getAllNote() async {
    _notfire(true);
    notes = await LocalDatabase.getAllDebtors();
    _notfire(false);
  }

  Future<void> deleteNote({required NoteModel noteModel}) async {
    if (noteModel.id != null) {
      _notfire(true);
      await LocalDatabase.deleteDebtors(noteModel.id!);
      getAllNote();
      _notfire(false);
    }
  }

  Future<void> insertNote({required NoteModel noteModel}) async {
    _notfire(true);
    await LocalDatabase.insertDebtors(noteModel);
    getAllNote();
    _notfire(false);
  }

  Future<void> updateNote({required NoteModel noteModel}) async {
    _notfire(true);
    await LocalDatabase.updateNote(noteModel: noteModel);
    getAllNote();
    _notfire(false);
  }

  _notfire(bool v) {
    _loading = v;
    notifyListeners();
  }
}
