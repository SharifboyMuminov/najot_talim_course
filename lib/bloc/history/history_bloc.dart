import 'package:default_project/bloc/history/history_event.dart';
import 'package:default_project/bloc/history/history_state.dart';
import 'package:default_project/data/enums/form_status.dart';
import 'package:default_project/data/local/local_database.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this._localDatabase)
      : super(
          const HistoryState(
            errorText: "",
            formsStatus: FormsStatus.pure,
            statusMessage: "",
            historyModels: [],
          ),
        ) {
    on<HistoryCallEvent>(_historyCallEvent);
    on<HistoryDeleteEvent>(_historyDeleteEvent);
    on<HistoryInsertEvent>(_historyInsertEvent);
  }

  final LocalDatabase _localDatabase;

  Future<void> _historyCallEvent(HistoryCallEvent event, emit) async {
    NetworkResponse networkResponse = await _localDatabase.getAllHistory();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          historyModels: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
        ),
      );
    }
  }

  Future<void> _historyDeleteEvent(HistoryDeleteEvent event, emit) async {
    NetworkResponse networkResponse =
        await _localDatabase.deleteHistory(event.historyModel.id);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          historyModels: state.removeHistory(event.historyModel),
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
        ),
      );
    }
  }

  Future<void> _historyInsertEvent(HistoryInsertEvent event, emit) async {
    NetworkResponse networkResponse =
        await _localDatabase.insertHistory(historyModel: event.historyModel);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          historyModels: state.addHistory(event.historyModel),
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
        ),
      );
    }
  }
}
