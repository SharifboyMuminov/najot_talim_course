import 'package:default_project/data/moduls/player/playerModel.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.plyers});

  final List<PlayerModel> plyers;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PlayerModel> newPlayr = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            TextFormField(
              onChanged: (v) {
                newPlayr = widget.plyers
                    .where((element) => element.firstName
                        .toLowerCase()
                        .contains(v.toLowerCase()))
                    .toList();
                setState(() {});
              },
            ),
            ...List.generate(
              newPlayr.length,
              (index) {
                return ListTile(
                  title: Text(newPlayr[index].firstName),
                  subtitle: Text(newPlayr[index].id.toString()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
