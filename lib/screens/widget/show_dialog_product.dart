import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../data/local/local_varibalse.dart';
import '../../data/model/messeg/message_model.dart';
import '../../view/message_view.dart';

void showDialogProduct(BuildContext context,
    {required ProductModel productModel}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(
          "Do you want to delete the reference?",
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Canel",
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<MessageViewModel>().addMessage(
                  messageModel: MessageModel(
                      name: "${productModel.nameProduct} Malumot o'chirildi",
                      id: idContLocal));
              context
                  .read<ProductViewModel>()
                  .deleteProduct(context, productModel: productModel);
              Navigator.pop(context);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    },
  );
}
