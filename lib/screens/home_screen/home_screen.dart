import 'package:default_project/screens/data/moduls/categoriy_info_modul.dart';
import 'package:flutter/material.dart';

import '../data/moduls/network_response.dart';
import '../data/repositories/catigory_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.id});
  final int id;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: categoryRepository.getInfoCategory(widget.id),
        builder: (BuildContext context, AsyncSnapshot<NetworRespons> snapshop) {
          if (snapshop.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (snapshop.hasData) {
            List<CategoryInfoModul> informatios =
                snapshop.data!.data as List<CategoryInfoModul>;
            return ListView(
              children: [
                ...List.generate(
                  informatios.length,
                  (index) {
                    return Image.network(informatios[index].imageUrl);
                  },
                ),
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
