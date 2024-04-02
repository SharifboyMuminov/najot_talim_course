import 'package:default_project/cubits/paln/plan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit() : super(PlanState([]));

  deletePlan(String v) {
    emit(state.deletePlan(v));
  }

  addPlan(String v) {
    emit(state.addPlan(v));
  }
}
