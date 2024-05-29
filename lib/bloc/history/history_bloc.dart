import 'package:default_project/bloc/history/history_event.dart';
import 'package:default_project/bloc/history/history_state.dart';
import 'package:default_project/data/enums/form_status.dart';
import 'package:default_project/data/local/local_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this._localDatabase)
      : super(
          HistoryState(
            errorText: "",
            formsStatus: FormsStatus.pure,
            statusMessage: "",
            historyModels: [],
          ),
        ) {
    on<HistoryCallEvent>(_historyCallEvent);
  }

  final LocalDatabase _localDatabase;

  Future<void> _historyCallEvent(HistoryCallEvent event, emit) async {}
}
