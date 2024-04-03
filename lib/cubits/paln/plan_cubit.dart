import 'package:default_project/cubits/paln/plan_state.dart';
import 'package:default_project/data/models/time/time_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit() : super(PlanState([]));

  deletePlan(TaskModel v) {
    emit(state.deletePlan(v));
  }

  addPlan(TaskModel v) {
    emit(state.addPlan(v));
  }
}
