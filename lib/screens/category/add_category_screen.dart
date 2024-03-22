import 'package:default_project/utils/size.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widget/text_input.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController textEditingControllerCategoryName =
      TextEditingController();

  TextEditingController textEditingControllerCategoryImage =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<CategoryViewModel>().noteficationError(false);
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 26.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CategoryViewModel>().insertTest(context,
                  nameCategory: textEditingControllerCategoryName.text,
                  imageUrl: textEditingControllerCategoryImage.text);
            },
            icon: Icon(
              Icons.check,
              size: 26.sp,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 25.he),
        child: Column(
          children: [
            TextInputMyWidget(
              label: 'Name product',
              textEditingController: textEditingControllerCategoryName,
              isError: context.watch<CategoryViewModel>().err,
            ),
            TextInputMyWidget(
              label: 'Image url',
              textEditingController: textEditingControllerCategoryImage,
              isError: context.watch<CategoryViewModel>().err,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
