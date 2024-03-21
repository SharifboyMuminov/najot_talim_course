import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool obThorText = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var providerListen = Provider.of<CategoryViewModel>(context);
    var provider = Provider.of<CategoryViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: providerListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ListView(
              children: [
                ...List.generate(
                  context.watch<CategoryViewModel>().categories.length,
                  (index) {
                    CategoryModel categoryModel =
                        context.watch<CategoryViewModel>().categories[index];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.we,vertical: 20.he),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            categoryModel.imageUrl,
                            width: 200,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10.we),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categoryModel.categoryName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              20.getH(),
                              Text(
                                categoryModel.countProduct.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.insertCategory(
            context,
            categoryModel: CategoryModel(
                countProduct: 11,
                categoryName: "Sharifjon",
                docId: "",
                imageUrl:
                    "https://atlas-content-cdn.pixelsquid.com/stock-images/women-s-pants-sweatpants-Od4xByD-600.jpg"),
          );
        },
      ),
    );
  }
}
