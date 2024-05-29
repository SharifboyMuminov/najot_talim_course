import 'package:default_project/bloc/region/region_bloc.dart';
import 'package:default_project/bloc/region/region_state.dart';
import 'package:default_project/data/enums/form_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegionBloc, RegionState>(
        builder: (BuildContext context, RegionState state) {
          if (state.formsStatus == FormsStatus.error) {
            return Center(
              child: Text(
                state.errorText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
              ),
            );
          }

          if (state.formsStatus == FormsStatus.success) {
            return ListView.builder(
              itemCount: state.currentRegions.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    state.currentRegions[index].regionName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
