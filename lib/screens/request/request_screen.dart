import 'package:default_project/screens/update_and_add_product/add_update_product_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/request_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/local/local_varibalse.dart';
import '../../data/model/product/produc_model.dart';
import '../../utils/app_colors.dart';
import '../info/info_screen.dart';
import '../widget/rate.dart';
import '../widget/stagger_grid.dart';

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
          : StaggerGridMyWidget(
              child: List.generate(
                context.watch<RequestViewModel>().requestProduct.length,
                (index) {
                  ProductModel productModel =
                      context.watch<RequestViewModel>().requestProduct[index];

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
