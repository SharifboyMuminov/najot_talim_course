import 'package:default_project/data/models/time/time_model.dart';

class PlanState {
  List<TaskModel> plans;


  PlanState(this.plans);

  PlanState addPlan(TaskModel v) {
    plans.add(v);
    return PlanState(plans);
  }

  PlanState deletePlan(TaskModel v) {
    plans.remove(v);
    return PlanState(plans);
  }
}
