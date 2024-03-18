import 'package:default_project/data/models/book/book_model.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/views/book_view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/text_filed.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController controllerModul = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerCategory = TextEditingController();
  TextEditingController controllerRate = TextEditingController();

  @override
  void initState() {
    controllerDescription.text = widget.bookModel.description;
    controllerModul.text = widget.bookModel.mualif;
    controllerName.text = widget.bookModel.name;
    controllerCategory.text = widget.bookModel.category.id.toString();
    controllerPrice.text = widget.bookModel.price.toString();
    controllerRate.text = widget.bookModel.rate.toString();

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
              hintText: '  Mualif: ',
              keyboardType: TextInputType.name,
            ),
            25.getH(),
            TextfiedMyWidget(
              controller: controllerName,
              hintText: '  Name: ',
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
              controller: controllerCategory,
              hintText: '  CategoryId: ',
              keyboardType: TextInputType.number,
            ),
            25.getH(),
            TextfiedMyWidget(
              controller: controllerRate,
              hintText: '  Rate: ',
              keyboardType: TextInputType.number,
            ),
            25.getH(),
            TextfiedMyWidget(
              controller: controllerDescription,
              hintText: '  Decreption: ',
              keyboardType: TextInputType.name,
            ),
            30.getH(),
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
                  if (controllerCategory.text.isNotEmpty &&
                      controllerDescription.text.isNotEmpty &&
                      controllerModul.text.isNotEmpty &&
                      controllerName.text.isNotEmpty &&
                      controllerPrice.text.isNotEmpty &&
                      controllerRate.text.isNotEmpty) {
                    BookModel bookModel = widget.bookModel.copyWithe();
                    bookModel = bookModel.copyWithe(
                        category:
                            getCategory(int.parse(controllerCategory.text)),
                        price: int.parse(controllerPrice.text),
                        name: controllerName.text,
                        mualif: controllerModul.text,
                        description: controllerDescription.text,
                        rate: double.parse(controllerRate.text));
                    await context
                        .read<BookViewModel>()
                        .updateBook(bookModel: bookModel);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The reference has been changed :)'),
                        ),
                      );
                      await Future.delayed(const Duration(seconds: 1));

                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error :('),
                      ),
                    );
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
