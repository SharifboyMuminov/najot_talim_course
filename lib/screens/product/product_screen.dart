import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/screens/widget/show_dialog_product.dart';
import 'package:default_project/screens/update_and_add_product/add_update_product_screen.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/screens/widget/product_item.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddAndUpdateScreen(
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
              child: RefreshIndicator.adaptive(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1), () {
                    context.read<ProductViewModel>().getProducts();
                  });
                },
                child: StaggerGridMyWidget(
                  child: List.generate(
                    providerListen.products.length,
                    (index) {
                      ProductModel productModel =
                          providerListen.products[index];

                      return ProductItem(
                          onLongPress: () {
                            showDialogProduct(context,
                                productModel: productModel);
                          },
                          index: index,
                          onTab: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return InfoScreen(productModel: productModel);
                                },
                              ),
                            );
                          },
                          productModel: productModel);
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
