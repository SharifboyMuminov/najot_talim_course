import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/screens/widget/stagger_grid.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widget/rate.dart';

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
      backgroundColor: AppColors.c_FFFFFF,
      appBar: AppBar(
        backgroundColor: AppColors.c_FFFFFF,
        centerTitle: false,
        title: Text(
          "Product Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return AddAndUpdateScreen(
              //         context: context,
              //       );
              //     },
              //   ),
              // );
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 25.sp,
            ),
          ),
        ],
      ),
      body: providerListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : RefreshIndicator.adaptive(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1), () {
                  provider.getProducts();
                });
              },
              child: StaggerGridMyWidget(
                child: List.generate(
                  providerListen.products.length,
                  (index) {
                    ProductModel productModel = providerListen.products[index];

                    // debugPrint("Ink");
                    return Ink(
                      height: index.isEven ? 200.he : 250.he,
                      padding: EdgeInsets.only(bottom: 5.he),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.c_FFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 1,
                            offset: const Offset(0, 17),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          globalAnimationController.reverse();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return InfoScreen(productModel: productModel);
                              },
                            ),
                          );
                        },
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "  ${productModel.nameProduct}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.we),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${productModel.price}som"),
                                  Rate(rate: productModel.rate.toString()),
                                ],
                              ),
                            ),
                          ],
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
