import 'package:default_project/data/models/categoriy/categori_model.dart';
import 'package:default_project/data/models/network_response.dart';
import 'package:flutter/material.dart';

import '../../data/network/api_provider.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ApiProvider apiProvider = ApiProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiProvider.getAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          if (snapshot.hasData) {
            List<CategoryModel> catigorys =
                (snapshot as NetworkResponse).data as List<CategoryModel>;
            return ListView(
              children: [
                ...List.generate(
                  catigorys.length,
                  (index) {
                    return Image.network(catigorys[index].imageUrl);
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
