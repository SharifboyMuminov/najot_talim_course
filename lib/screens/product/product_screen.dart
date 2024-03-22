import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/screens/product/add_product_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../view/categoriy_view.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var providerListen = Provider.of<ProductViewModel>(context);
    var provider = Provider.of<ProductViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddScreen(
                      context: context,
                    );
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
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
              children: [
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    ...List.generate(
                      providerListen.products.length,
                      (index) {
                        ProductModel productModel =
                            providerListen.products[index];
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
                                        provider.deleteProduct(context, productModel: productModel);
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              height: index.isEven ? 200 : 250,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      productModel.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(productModel.phoneNumber),
                                  Text(productModel.price.toString()),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
