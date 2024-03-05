import 'package:default_project/data/models/product/product_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/screens/add/add_screen.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiProvider apiProvider = ApiProvider();
  ScrollController scrollController = ScrollController();
  double elevetion = 0;

  change() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 0) {
        elevetion = 1;
      } else {
        elevetion = 0;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddScreen(
                      onSet: () {
                        setState(() {});
                      },
                    );
                  },
                ),
              );
            },
            icon: Icon(
              Icons.add,
              size: 25.sp,
              color: Colors.black,
            ),
          ),
        ],
        elevation: elevetion,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Apple Shoping",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
              color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: apiProvider.getAllProduct(),
        builder: (context, snapshop) {
          if (snapshop.hasData) {
            List<ProductModul> products =
                snapshop.data!.data as List<ProductModul>;
            return ListView(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 8.he),
              children: [
                ...List.generate(
                  products.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.we, vertical: 10.he),
                      child: TextButton(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: const Text(
                                    "Do you want to delete the product?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Canel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await apiProvider.deleteProduct(
                                          products[index].prodictId);
                                      change();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(bottom: 10.he),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InfoScreen(
                                  productModul: products[index],
                                  onSet: () {
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.r),
                              child: Image.network(products[index].imageUrl),
                            ),
                            10.getH(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.we),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    products[index].prodctName,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    products[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 22.sp, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          if (snapshop.hasError) {
            return Center(
              child: Text(snapshop.data!.errorText),
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
