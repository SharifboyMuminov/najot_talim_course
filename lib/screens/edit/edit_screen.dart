import 'package:default_project/data/models/product/product_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/text_fild.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key, required this.productModul, required this.onSet});
  final ProductModul productModul;
  final VoidCallback onSet;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  ApiProvider apiProvider = ApiProvider();
  ProductModul? productModul;
  TextEditingController controllerModul = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  @override
  void initState() {
    productModul = widget.productModul;
    controllerDescription.text = productModul!.decoretion;
    controllerModul.text = productModul!.prodctName;
    controllerPrice.text = productModul!.price.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Edit Prtoduct",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22.sp,
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 40.he),
        child: Column(
          children: [
            TextfiedMyWidget(
              controller: controllerModul,
              hintText: '  Modul: ',
              keyboardType: TextInputType.name,
            ),
            25.getH(),
            TextfiedMyWidget(
              controller: controllerPrice,
              hintText: '  Price: ',
              keyboardType: TextInputType.number,
            ),
            25.getH(),
            TextfiedMyWidget(
              controller: controllerDescription,
              hintText: '  Decreption: ',
              keyboardType: TextInputType.name,
            ),
            280.getH(),
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
                  if (controllerDescription.text.isNotEmpty &&
                      controllerModul.text.isNotEmpty &&
                      controllerPrice.text.isNotEmpty) {
                    if (productModul != null) {
                      productModul = productModul?.copyWithe(
                        prodctName: controllerModul.text,
                        price: double.parse(controllerPrice.text),
                        decoretion: controllerDescription.text,
                      );
                      await apiProvider.updateProduct(productModul!);
                      widget.onSet.call();
                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    }
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
