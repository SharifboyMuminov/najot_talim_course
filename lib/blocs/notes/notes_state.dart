import 'package:default_project/data/models/from_status/from_status.dart';
import 'package:default_project/data/models/notes/note.dart';
import 'package:equatable/equatable.dart';

class NotesState extends Equatable {
  final FromStatus fromStatus;
  final String errorText;
  final String statusMessage;
  final List<NoteModel> currentNotes;
  final List<NoteModel> allNotes;

  const NotesState({
    required this.allNotes,
    required this.currentNotes,
    required this.fromStatus,
    required this.errorText,
    required this.statusMessage,
  });

  NotesState copyWith({
    FromStatus? fromStatus,
    String? errorText,
    String? statusMessage,
    List<NoteModel>? currentNotes,
    List<NoteModel>? allNotes,
  }) {
    return NotesState(
      allNotes: allNotes ?? this.allNotes,
      currentNotes: currentNotes ?? this.currentNotes,
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        errorText,
        statusMessage,
        allNotes,
        currentNotes,
      ];
}
