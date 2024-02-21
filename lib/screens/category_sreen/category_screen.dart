import 'package:default_project/screens/category_sreen/widget/categoriy_button.dart';
import 'package:default_project/screens/data/moduls/network_response.dart';
import 'package:default_project/screens/data/repositories/catigory_repository.dart';
import 'package:default_project/screens/home_screen/home_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import '../data/moduls/catigori_modul.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
        future: categoryRepository.getAllCategoriy(),
        builder: (context, AsyncSnapshot<NetworRespons> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.data!.errorText),
            );
          } else if (snapshot.data != null) {
            List<CatigoriyModul> catigoriyes =
                snapshot.data!.data as List<CatigoriyModul>;
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 60.he, horizontal: 20.we),
              children: [
                ...List.generate(
                  catigoriyes.length,
                  (index) {
                    return CategoryButton(
                      title: catigoriyes[index].name,
                      urlImage: catigoriyes[index].imageUrl,
                      onTab: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(id: catigoriyes[index].id);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
