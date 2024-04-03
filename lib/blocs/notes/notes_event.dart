import 'package:default_project/data/moduls/notes/note.dart';

abstract class NotesEvent {}

class NotesDeleteEvent extends NotesEvent {
  final NoteModel noteModel;

  NotesDeleteEvent({required this.noteModel});
}

class NotesInsertEvent extends NotesEvent {
  final NoteModel noteModel;

  NotesInsertEvent({required this.noteModel});
}

class NotesCallEvent extends NotesEvent {}

class NotesUpdateEvent extends NotesEvent {
  final NoteModel noteModel;

  NotesUpdateEvent({required this.noteModel});
}

class NotesSearchEvent extends NotesEvent {
  final String title;

  NotesSearchEvent({required this.title});
}
