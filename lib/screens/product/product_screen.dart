import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/screens/product/add_product_screen.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/screens/widget/stagger_grid.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
          : Padding(
              padding: EdgeInsets.only(bottom: 100.he),
              child: StaggerGridMyWidget(
                child: List.generate(
                  providerListen.products.length,
                  (index) {
                    ProductModel productModel = providerListen.products[index];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Ink(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 40,
                              spreadRadius: 7,
                              offset: Offset(0, 30),
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return InfoScreen(productModel: productModel);
                                },
                              ),
                            );
                          },
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
                                        provider.deleteProduct(context,
                                            productModel: productModel);
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
                                  child: Hero(
                                    tag: productModel.docId,
                                    child: Image.network(
                                      productModel.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(productModel.nameProduct),
                                Text(productModel.price.toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
