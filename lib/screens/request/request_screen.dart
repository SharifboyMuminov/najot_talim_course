import 'package:default_project/screens/update_and_add_product/add_update_product_screen.dart';
import 'package:default_project/screens/widget/product_item.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/request_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/local/local_varibalse.dart';
import '../../data/model/product/produc_model.dart';
import '../../utils/app_colors.dart';
import '../info/info_screen.dart';
import '../widget/rate.dart';
import '../widget/stagger_grid.dart';
import 'widget/show_dialog.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Request Screen",
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
                    return AddAndUpdateScreen(context: context);
                  },
                ),
              );
            },
            icon: Icon(
              Icons.add,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: context.watch<RequestViewModel>().loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : RefreshIndicator.adaptive(
            onRefresh: ()async {
              await Future.delayed(const Duration(seconds: 1), () {
                context.read<RequestViewModel>().getProducts();
              });
            },
            child: StaggerGridMyWidget(
                child: List.generate(
                  context.watch<RequestViewModel>().requestProduct.length,
                  (index) {
                    ProductModel productModel =
                        context.watch<RequestViewModel>().requestProduct[index];

                    // debugPrint("Ink");
                    return ProductItem(
                        onLongPress: () {
                          showMyDialog(context, productModel: productModel);
                        },
                        index: index,
                        onTab: () {
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
                        productModel: productModel);
                  },
                ),
              ),
          ),
    );
  }
}
