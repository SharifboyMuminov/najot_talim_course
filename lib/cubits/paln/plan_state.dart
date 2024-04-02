class PlanState {
  List<String> plans;


  PlanState(this.plans);

  PlanState addPlan(String v) {
    plans.add(v);
    return PlanState(plans);
  }

  PlanState deletePlan(String v) {
    plans.remove(v);
    return PlanState(plans);
  }
}
