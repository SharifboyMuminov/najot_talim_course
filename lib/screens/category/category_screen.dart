import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/category/category_model.dart';
import 'package:default_project/screens/category/add_category_screen.dart';
import 'package:default_project/screens/category/show_products_category.dart';
import 'package:default_project/services/local_notification_service.dart';
import 'package:default_project/utils/app_colors.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/model/messeg/message_model.dart';
import '../../view/message_view.dart';
import 'widget/show_reques.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  bool obThorText = false;

  @override
  void initState() {
    getMyToken();
    super.initState();
  }

  getMyToken() async {
    var tok = await FirebaseMessaging.instance.getToken();
    // debugPrint("Qonday ${tok}");

    FirebaseMessaging.onMessage.listen((RemoteMessage remote) {
      if (remote.notification!.title != null) {
        debugPrint(remote.notification!.title.toString());
        LocalNotificationService.localNotificationService.showNotification(
          title: remote.notification!.title.toString(),
          body: remote.notification!.body.toString(),
          id: 0,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var providerListen = Provider.of<CategoryViewModel>(context);
    User? user = context.watch<AuthViewModel>().getUser;

    return Scaffold(
      body: providerListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: AppColors.c_FFFFFF,
                  pinned: true,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const AddCategoryScreen();
                            },
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        size: 24.sp,
                      ),
                    ),
                  ],
                  expandedHeight: 120.he,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.we, vertical: 20.he),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Assalomu aleykum",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 22.sp,
                            ),
                          ),
                          Text(
                            user == null ? "" : user.displayName.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: 100.he,
                    left: 15.we,
                    right: 15.he,
                  ),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: providerListen.categories.length,
                      (context, index) {
                        CategoryModel categoryModel = context
                            .watch<CategoryViewModel>()
                            .categories[index];
                        return InkWell(
                          onTap: () {
                            globalAnimationController.reverse();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ShowCategoryProductScreen(
                                    categoryModel: categoryModel,
                                  );
                                },
                              ),
                            );
                          },
                          onLongPress: () {
                            showRequest(
                              context,
                              categoryModel: categoryModel,
                            );
                            context.read<MessageViewModel>().addMessage(
                                messageModel: MessageModel(
                                    name: 'category  Malumot o\'chirildi :)',
                                    id: idContLocal));
                            idContLocal++;
                          },
                          child: Container(
                            height: index.isEven ? 200 : 250,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.we, vertical: 20.he),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                image: NetworkImage(categoryModel.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categoryModel.categoryName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      mainAxisSpacing: 20.he, // Spacing between rows
                      crossAxisSpacing: 20.we, // Spacing between columns
                      childAspectRatio: 0.7, // Aspect ratio of each grid item
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
