import 'dart:async';

import 'package:default_project/blocs/notes/notes_event.dart';
import 'package:default_project/blocs/notes/notes_state.dart';
import 'package:default_project/data/local/local_database/local_databas.dart';
import 'package:default_project/data/models/from_status/from_status.dart';
import 'package:default_project/data/models/my_resposn/my_respons.dart';
import 'package:default_project/data/models/notes/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(this._localDatabase)
      : super(
          const NotesState(
            allNotes: [],
            currentNotes: [],
            fromStatus: FromStatus.pure,
            errorText: "",
            statusMessage: "",
          ),
        ) {
    on<NotesCallEvent>(_callNoteData);
    on<NotesDeleteEvent>(_deleteNote);
    on<NotesInsertEvent>(_insertNote);
    on<NotesUpdateEvent>(_updateNote);
    on<NotesSearchEvent>(_searchNote);
  }

  final LocalDatabase _localDatabase;

  Future<void> _callNoteData(
      NotesCallEvent notesCallEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    MyResponse myResponse = await _localDatabase.getAllNotes();

    if (myResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          allNotes: myResponse.data,
          currentNotes: myResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: myResponse.errorText,
        ),
      );
    }
  }

  Future<void> _deleteNote(
      NotesDeleteEvent notesDeleteEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
    MyResponse myResponse =
        await _localDatabase.deleteNotes(notesDeleteEvent.noteModel);

    if (myResponse.errorText.isEmpty) {
      add(NotesCallEvent());
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: myResponse.errorText,
        ),
      );
    }
  }

  Future<void> _insertNote(
      NotesInsertEvent notesInsertEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    MyResponse myResponse =
        await _localDatabase.insertNotes(notesInsertEvent.noteModel);

    if (myResponse.errorText.isEmpty) {
      List<NoteModel> notes = state.allNotes;
      notes.add(myResponse.data);

      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          allNotes: notes,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: myResponse.errorText,
        ),
      );
    }
  }

  Future<void> _updateNote(
      NotesUpdateEvent notesUpdateEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    MyResponse myResponse =
        await _localDatabase.updateNotes(noteModel: notesUpdateEvent.noteModel);

    if (myResponse.errorText.isNotEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: myResponse.errorText,
        ),
      );
    }
    add(NotesCallEvent());
  }

  Future<void> _searchNote(
      NotesSearchEvent notesSearchEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    if (notesSearchEvent.title.isNotEmpty) {
      MyResponse myResponse =
          await _localDatabase.searchNotes(notesSearchEvent.title);

      if (myResponse.errorText.isEmpty) {
        emit(
          state.copyWith(
            fromStatus: FromStatus.success,
            allNotes: myResponse.data,
          ),
        );
      } else {
        emit(
          state.copyWith(
            fromStatus: FromStatus.error,
            errorText: myResponse.errorText,
          ),
        );
      }
    } else {
      add(NotesCallEvent());
    }
  }
}
