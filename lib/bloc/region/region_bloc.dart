import 'package:default_project/bloc/region/region_event.dart';
import 'package:default_project/bloc/region/region_state.dart';
import 'package:default_project/data/enums/form_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  RegionBloc()
      : super(
          const RegionState(
            formsStatus: FormsStatus.pure,
            errorText: '',
            statusMessage: '',
            currentRegions: [],
            regions: [],
          ),
        ) {
    // on((event, emit) => null)
  }
}
