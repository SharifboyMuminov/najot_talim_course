import 'package:default_project/data/models/product/product_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/text_fild.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.onSet});
  final VoidCallback onSet;

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerDescreption = TextEditingController();
  TextEditingController controllerImageUrl = TextEditingController();
  ProductModul productModul = ProductModul.getDefaultProduct();
  ApiProvider apiProvider = ApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Product",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 30.he),
        child: Column(
          children: [
            TextfiedMyWidget(
              keyboardType: TextInputType.name,
              controller: controllerName,
              hintText: '  Modul: ',
            ),
            20.getH(),
            TextfiedMyWidget(
              keyboardType: TextInputType.name,
              controller: controllerPrice,
              hintText: '  Price: ',
            ),
            20.getH(),
            TextfiedMyWidget(
              keyboardType: TextInputType.name,
              controller: controllerImageUrl,
              hintText: '  Image Url: ',
            ),
            20.getH(),
            TextfiedMyWidget(
              keyboardType: TextInputType.name,
              controller: controllerDescreption,
              hintText: '  Descreption: ',
            ),
            260.getH(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.he),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    side: BorderSide(color: Colors.black, width: 1.we)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Canel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            10.getH(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.he),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r)),
                    backgroundColor: Colors.blue),
                onPressed: () async {
                  if (controllerDescreption.text.isNotEmpty &&
                      controllerImageUrl.text.isNotEmpty &&
                      controllerName.text.isNotEmpty &&
                      controllerPrice.text.isNotEmpty) {
                    productModul = productModul.copyWithe(
                      decoretion: controllerDescreption.text,
                      price: double.parse(controllerPrice.text),
                      prodctName: controllerName.text,
                      imageUrl: controllerImageUrl.text,
                    );

                    await apiProvider.addProduct(productModul);
                    widget.onSet.call();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
