import 'package:default_project/data/models/history/history_model.dart';
import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {}

class HistoryCallEvent extends HistoryEvent {
  @override
  List<Object?> get props => [];
}

class HistoryDeleteEvent extends HistoryEvent {
  final HistoryModel historyModel;

  HistoryDeleteEvent({required this.historyModel});

  @override
  List<Object?> get props => [historyModel];
}

class HistoryInsertEvent extends HistoryEvent {
  final HistoryModel historyModel;

  HistoryInsertEvent({required this.historyModel});

  @override
  List<Object?> get props => [historyModel];
}
