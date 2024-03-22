import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/screens/category/add_category_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddCategoryScreen();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.add,
              size: 25.sp,
            ),
          ),
        ],
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
                    return InkWell(
                      onTap: () {},
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog.adaptive(
                              title: Text(
                                "Do you want to delete the reference?",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Canel",
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    provider.deleteCategory(context,
                                        docId: categoryModel.docId);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.we, vertical: 20.he),
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
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
