import 'package:default_project/screens/data/moduls/categoriy_info_modul.dart';
import 'package:default_project/screens/home_screen/widget/grid_view_item.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

import '../data/moduls/network_response.dart';
import '../data/repositories/catigory_repository.dart';
import '../info_screen/info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.id,
      required this.category,
      required this.isChangeView});
  final int id;
  final String category;
  final bool isChangeView;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryRepository categoryRepository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(widget.category),
      ),
      body: widget.isChangeView
          ? FutureBuilder(
              future: categoryRepository.getAllProduct(),
              builder: (BuildContext context,
                  AsyncSnapshot<NetworRespons> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.hasData) {
                  List<CategoryInfoModul> products =
                      snapshot.data!.data as List<CategoryInfoModul>;
                  return GridView.count(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.we, vertical: 30.he),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.we,
                    mainAxisSpacing: 20.he,
                    children: [
                      ...List.generate(
                        products.length,
                        (index) {
                          return GridViewItemButton(
                            title: products[index].name,
                            urlImage: products[index].imageUrl,
                            onTab: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return InfoScreen(
                                      infoModul: products[index],
                                    );
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
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            )
          : FutureBuilder(
              future: categoryRepository.getInfoCategory(widget.id),
              builder: (BuildContext context,
                  AsyncSnapshot<NetworRespons> snapshop) {
                if (snapshop.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                }
                if (snapshop.hasData) {
                  List<CategoryInfoModul> informatios =
                      snapshop.data!.data as List<CategoryInfoModul>;
                  return GridView.count(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.we, vertical: 30.he),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.we,
                    mainAxisSpacing: 20.he,
                    children: [
                      ...List.generate(
                        informatios.length,
                        (index) {
                          return GridViewItemButton(
                            title: informatios[index].name,
                            urlImage: informatios[index].imageUrl,
                            onTab: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return InfoScreen(
                                      infoModul: informatios[index],
                                    );
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
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
    );
  }
}
