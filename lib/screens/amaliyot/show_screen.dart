import 'package:default_project/data/moduls/compyuter_modul/compyuter_modul.dart';
import 'package:default_project/data/moduls/network_response.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/compyuter_repository.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  CompyuterRepository compyuterRepository = CompyuterRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: compyuterRepository.fitchAll(),
      builder: (BuildContext context, AsyncSnapshot<NetworkResponse> snapshot) {
        if (snapshot.hasError) {
          Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.hasData) {
          List<CompyuterModel> compyuters =
              snapshot.data!.data as List<CompyuterModel>;
          return ListView(
            children: [
              ...List.generate(compyuters.length,
                  (index) => Image.network(compyuters[index].imageUrl)),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
