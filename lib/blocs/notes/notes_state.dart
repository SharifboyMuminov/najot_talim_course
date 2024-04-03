import 'package:default_project/data/moduls/notes/note.dart';

abstract class NotesState {}

class LoadingState extends NotesState {}

class SuccessState extends NotesState {
  List<NoteModel> notesData;

  SuccessState({required this.notesData});
}
