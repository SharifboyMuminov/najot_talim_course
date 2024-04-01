import 'package:default_project/cubits/country/country.dart';
import 'package:default_project/cubits/country/country_state.dart';
import 'package:default_project/data/models/country/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Countries",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
          builder: (BuildContext context, state) {
        if (state.myStatus == MyStatus.loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state.myStatus == MyStatus.error) {
          return Center(child: Text(state.errorText));
        }

        return ListView.builder(
          itemCount: state.countries.length,
          itemBuilder: (context, index) {
            CountryModel countryModel = state.countries[index];

            return ListTile(
              title: Text(
                countryModel.name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                countryModel.emoji,
                style: TextStyle(
                  fontSize: 30.sp,
                ),
              ),
              subtitle: Text("Code ${countryModel.code}"),
            );
          },
        );
      }),
    );
  }
}
