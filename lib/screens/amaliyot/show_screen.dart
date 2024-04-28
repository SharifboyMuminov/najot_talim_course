import 'package:default_project/data/moduls/compyuter_modul/compyuter_modul.dart';
import 'package:default_project/data/moduls/network_response.dart';
import 'package:default_project/data/moduls/player/playerModel.dart';
import 'package:default_project/data/network/api_preovider.dart';
import 'package:default_project/screens/searche.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/compyuter_repository.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  CompyuterRepository compyuterRepository = CompyuterRepository();
  List<PlayerModel> players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SearchScreen(plyers: players);
                },
              ),
            );
          },
          icon: Icon(Icons.search),
        ),
      ),
      body: FutureBuilder(
        future: ApiPreovider.fitchPlayer(),
        builder:
            (BuildContext context, AsyncSnapshot<NetworkResponse> snapshot) {
          if (snapshot.hasError) {
            Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            List<PlayerModel> compyuters =
                snapshot.data!.data as List<PlayerModel>;
            players = compyuters;

            return ListView(
              children: [
                ...List.generate(
                    compyuters.length,
                    (index) => Text(
                          compyuters[index].firstName,
                          style: TextStyle(fontSize: 24,color: Colors.black),
                        )),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
