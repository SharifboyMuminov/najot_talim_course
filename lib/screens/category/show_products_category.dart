import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/screens/info/info_screen.dart';
import 'package:default_project/screens/widget/product_item.dart';
import 'package:default_project/screens/widget/show_dialog_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/model/product/produc_model.dart';
import '../../view/product_view.dart';
import '../widget/stagger_grid.dart';

class ShowCategoryProductScreen extends StatefulWidget {
  const ShowCategoryProductScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<ShowCategoryProductScreen> createState() =>
      _ShowCategoryProductScreenState();
}

class _ShowCategoryProductScreenState extends State<ShowCategoryProductScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context
          .read<ProductViewModel>()
          .getProductsCategory(widget.categoryModel.docId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var providerListen = Provider.of<ProductViewModel>(context);
    var provider = Provider.of<ProductViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            globalAnimationController.forward();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.sp,
          ),
        ),
        centerTitle: false,
        title: Text(
          widget.categoryModel.categoryName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
          ),
        ),
      ),
      body: providerListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : StaggerGridMyWidget(
              child: List.generate(
                providerListen.productsCategory.length,
                (index) {
                  ProductModel productModel = providerListen.products[index];

                  return ProductItem(
                      onLongPress: (){
                        showDialogProduct(context, productModel: productModel);
                      },
                      index: index,
                      onTab: (){
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
    );
  }
}
