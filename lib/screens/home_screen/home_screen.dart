import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/category/category_model.dart';
import 'package:default_project/screens/home_screen/widget/category_view.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var activeIndex = 0;
  final ScrollController _scrollController = ScrollController();

  List<double> asd = [];

  @override
  void initState() {
    _listenScrollController();
    super.initState();
  }

  _listenScrollController() {
    for (CategoryModel categoryModel in globalCategoryModels) {
      asd.add(((categoryModel.products.length * 93.he) + 63));
    }

    _scrollController.addListener(() {
      debugPrint(_scrollController.position.pixels.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverAppBar(
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30.he,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CategoryView(
                onChangeIndex: (int value) {
                  activeIndex = value;
                  setState(() {});
                },
                activeIndex: activeIndex),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: globalCategoryModels.length,
              (context, indexOne) {
                return Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 15.he, horizontal: 5.we),
                  padding: EdgeInsets.only(
                    top: 45.he,
                    left: 15.we,
                    right: 15.we,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        globalCategoryModels[indexOne].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ...List.generate(
                        globalCategoryModels[indexOne].products.length,
                        (indexTwo) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5.he),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        globalCategoryModels[indexOne]
                                            .products[indexTwo]
                                            .title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.sp,
                                          height: 3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "${globalCategoryModels[indexOne].products[indexTwo].price} \$",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.we),
                                CachedNetworkImage(
                                  imageUrl: globalCategoryModels[indexOne]
                                      .products[indexTwo]
                                      .imageUrl,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) => const Center(
                                      child:
                                          CircularProgressIndicator.adaptive()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
                //
              },
            ),
          ),
        ],
      ),
    );
  }
}
