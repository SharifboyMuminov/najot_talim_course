import 'package:default_project/data/enums/form_status.dart';
import 'package:default_project/data/models/history/history_model.dart';
import 'package:equatable/equatable.dart';

class HistoryState extends Equatable {
  final FormsStatus formsStatus;
  final String errorText;
  final String statusMessage;
  final List<HistoryModel> historyModels;

  const HistoryState({
    required this.errorText,
    required this.formsStatus,
    required this.statusMessage,
    required this.historyModels,
  });

  HistoryState copyWith({
    FormsStatus? formsStatus,
    String? errorText,
    String? statusMessage,
    List<HistoryModel>? historyModels,
  }) {
    return HistoryState(
      formsStatus: formsStatus ?? this.formsStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
      historyModels: historyModels ?? this.historyModels,
    );
  }

  List<HistoryModel> removeHistory(HistoryModel value) {
    List<HistoryModel> myHistoryModels = historyModels;

    myHistoryModels.remove(value);

    return myHistoryModels;
  }

  List<HistoryModel> addHistory(HistoryModel value) {
    List<HistoryModel> myHistoryModels = historyModels;

    myHistoryModels.add(value);

    return myHistoryModels;
  }

  @override
  List<Object?> get props => [
        formsStatus,
        errorText,
        statusMessage,
        historyModels,
      ];
}
