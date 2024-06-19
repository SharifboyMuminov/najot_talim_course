import 'package:default_project/data/models/notes/note.dart';
import 'package:equatable/equatable.dart';

abstract class NotesEvent extends Equatable {}

class NotesDeleteEvent extends NotesEvent {
  final NoteModel noteModel;

  NotesDeleteEvent({required this.noteModel});

  @override
  List<Object?> get props => [noteModel];
}

class NotesInsertEvent extends NotesEvent {
  final NoteModel noteModel;

  NotesInsertEvent({required this.noteModel});

  @override
  List<Object?> get props => [noteModel];
}

class NotesCallEvent extends NotesEvent {
  @override
  List<Object?> get props => [];
}

class NotesUpdateEvent extends NotesEvent {
  final NoteModel noteModel;

  NotesUpdateEvent({required this.noteModel});

  @override
  List<Object?> get props => [noteModel];
}

class NotesSearchEvent extends NotesEvent {
  final String title;

  NotesSearchEvent({required this.title});

  @override
  List<Object?> get props => [title];
}
