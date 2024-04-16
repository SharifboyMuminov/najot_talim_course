import 'package:default_project/blocs/country/country_bloc.dart';
import 'package:default_project/blocs/country/country_event.dart';
import 'package:default_project/screens/country/country_screen.dart';
import 'package:default_project/screens/home_screen/widget/country_button.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryButton(
            onTab: () {
              context
                  .read<CountryBloc>()
                  .add(LocationCountry(locationCountry: "AS"));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CountryScreen(locationCountry: "AS");
                  },
                ),
              );
            },
            title: "Asia",
          ),
          CountryButton(
            onTab: () {
              context
                  .read<CountryBloc>()
                  .add(LocationCountry(locationCountry: "EU"));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CountryScreen(locationCountry: "EU");
                  },
                ),
              );
            },
            title: "Europe",
          ),
          CountryButton(
            onTab: () {
              context
                  .read<CountryBloc>()
                  .add(LocationCountry(locationCountry: "OC"));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CountryScreen(locationCountry: "OC");
                  },
                ),
              );
            },
            title: "Oceania",
          ),
          CountryButton(
            onTab: () {
              context
                  .read<CountryBloc>()
                  .add(LocationCountry(locationCountry: "AF"));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CountryScreen(locationCountry: "AF");
                  },
                ),
              );
            },
            title: "Africa",
          ),
          CountryButton(
            onTab: () {
              context
                  .read<CountryBloc>()
                  .add(CallCountry());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CountryScreen();
                  },
                ),
              );
            },
            title: "All Countries",
          ),
        ],
      ),
    );
  }
}
