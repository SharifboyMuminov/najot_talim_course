import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/screens/update_and_add_product/add_update_product_screen.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/product_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widget/rate.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late ProductModel productModel;

  @override
  void initState() {
    productModel = widget.productModel;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_FFFFFF,
      body: context.watch<ProductViewModel>().loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.c_FFFFFF,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      globalAnimationController.forward();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25.sp,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25.sp,
                      ),
                    ),
                  ],
                  expandedHeight: 400.he,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        50.getH(),
                        Expanded(
                          child: Hero(
                            tag: productModel.docId,
                            child: Image.network(
                              productModel.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList.list(
                  children: [
                    Container(
                      color: AppColors.c_FFFFFF,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.we, vertical: 20.he),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.r),
                            topRight: Radius.circular(15.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productModel.nameProduct,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 22.sp,
                              ),
                            ),
                            10.getH(),
                            Text(
                              "${productModel.price} sum",
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 22.sp,
                              ),
                            ),
                            10.getH(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productModel.gender != "Universal"
                                      ? "For ${productModel.gender}"
                                      : productModel.gender,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22.sp,
                                  ),
                                ),
                                Rate(rate: productModel.rate.toString()),
                              ],
                            ),
                            20.getH(),
                            Text(
                              "Description:",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 22.sp,
                              ),
                            ),
                            10.getH(),
                            Text(
                              productModel.description,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
