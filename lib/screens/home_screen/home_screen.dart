import 'package:cached_network_image/cached_network_image.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/screens/home_screen/widget/category_view.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var activIndex = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                  activIndex = value;
                  setState(() {});
                },
                activIndex: activIndex),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: globalCategoryModels.length,
              (context, indexOne) {
                return Column(
                  children: [
                    ...List.generate(
                      globalCategoryModels[indexOne].products.length,
                      (indexTwo) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: globalCategoryModels[indexOne]
                                    .products[indexTwo]
                                    .imageUrl,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const Center(child: CircularProgressIndicator.adaptive()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
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
