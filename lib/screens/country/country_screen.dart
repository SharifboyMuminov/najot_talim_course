import 'package:default_project/blocs/country/country_bloc.dart';
import 'package:default_project/blocs/country/country_event.dart';
import 'package:default_project/blocs/country/country_state.dart';
import 'package:default_project/screens/country/widget/input_search.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/countyr_item.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key, this.locationCountry});

  final String? locationCountry;

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Countries ${widget.locationCountry ?? ""}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SearchInput(onChange: (v) {
            context.read<CountryBloc>().add(SearchCountry(
                nameCountry: v, location: widget.locationCountry ?? ""));
          }),
          BlocBuilder<CountryBloc, CountryState>(
            builder: (BuildContext context, CountryState state) {
              if (state is ErrorState) {
                return Center(
                  child: Text(state.errorText),
                );
              }
              if (state is QueryOkState) {
                if (state.countries.isEmpty) {
                  return SizedBox(
                    height: height / 2,
                    child: Image.network(
                        "https://i.pinimg.com/originals/05/c7/9e/05c79ee812c45a7535f749cf5e49e94e.png"),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CountryItem(
                        countryModel: state.countries[index],
                      );
                    },
                  ),
                );
              }

              return SizedBox(
                  height: height / 1.5,
                  child: const CircularProgressIndicator.adaptive());
            },
          ),
        ],
      ),
    );
  }
}
