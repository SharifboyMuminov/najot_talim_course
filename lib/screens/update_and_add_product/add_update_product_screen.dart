import 'package:default_project/data/local/local_varibalse.dart';
import 'package:default_project/data/model/product/produc_model.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/product_view.dart';
import 'package:default_project/view/request_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../view/categoriy_view.dart';
import '../widget/text_input.dart';

class AddAndUpdateScreen extends StatefulWidget {
  const AddAndUpdateScreen({super.key, required this.context, this.productModel});

  final BuildContext context;
  final ProductModel? productModel;

  @override
  State<AddAndUpdateScreen> createState() => _AddAndUpdateScreenState();
}

class _AddAndUpdateScreenState extends State<AddAndUpdateScreen> {
  TextEditingController textEditingControllerProductName =
      TextEditingController();

  TextEditingController textEditingControllerProductImage =
      TextEditingController();
  TextEditingController textEditingControllerProductPrice =
      TextEditingController();
  TextEditingController textEditingControllerProductPhoneNumber =
      TextEditingController();
  TextEditingController textEditingControllerRate = TextEditingController();
  TextEditingController textEditingControllerDescription =
      TextEditingController();

  String textCategory = "";
  late List<String> listCategory;
  String textGender = "Universal";

  List<String> listGender = [
    "Men",
    "Woman",
    "Universal",
  ];

  @override
  void initState() {
    if (widget.productModel != null) {
      textEditingControllerProductImage.text = widget.productModel!.imageUrl;
      textEditingControllerProductName.text = widget.productModel!.nameProduct;
      textEditingControllerDescription.text = widget.productModel!.description;
      textEditingControllerRate.text = widget.productModel!.rate.toString();
      textEditingControllerProductPrice.text =
          widget.productModel!.price.toString();
      textEditingControllerProductPhoneNumber.text =
          widget.productModel!.phoneNumber;
      textGender = widget.productModel!.gender;
      textCategory = widget.productModel!.categoryId;
    }
    initList();
    super.initState();
  }

  initList() {
    listCategory = widget.context
        .watch<CategoryViewModel>()
        .categories
        .map((e) => e.categoryName)
        .toList();
    textCategory = listCategory.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var providerListen = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.read<ProductViewModel>().noteficationError(false);
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 26.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              context.read<RequestViewModel>().testInsert(context,
                  description: textEditingControllerDescription.text,
                  nameProduct: textEditingControllerProductName.text,
                  genderProduct: textGender,
                  imageUrl: textEditingControllerProductImage.text,
                  phoneNumber: textEditingControllerProductPhoneNumber.text,
                  price: textEditingControllerProductPrice.text,
                  rate: textEditingControllerRate.text,
                  categoryId: textCategory,
                  productModelKegan: widget.productModel);
              Navigator.pop(context);
              if (widget.productModel != null) {
                globalAnimationController.forward();
                Navigator.pop(context);
              }
            },
            icon: Icon(
              Icons.check,
              size: 26.sp,
            ),
          )
        ],
      ),
      body: providerListen.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInputMyWidget(
                    label: 'Name product',
                    textEditingController: textEditingControllerProductName,
                    isError: providerListen.error,
                  ),
                  TextInputMyWidget(
                    label: 'Image url',
                    textEditingController: textEditingControllerProductImage,
                    isError: providerListen.error,
                  ),
                  TextInputMyWidget(
                    label: 'Description',
                    textEditingController: textEditingControllerDescription,
                    isError: providerListen.error,
                  ),
                  TextInputMyWidget(
                    label: 'Phone number',
                    textEditingController:
                        textEditingControllerProductPhoneNumber,
                    isError: providerListen.error,
                  ),
                  TextInputMyWidget(
                    label: 'Prise',
                    textEditingController: textEditingControllerProductPrice,
                    isError: providerListen.error,
                    textInputType: TextInputType.number,
                  ),
                  TextInputMyWidget(
                    label: 'Rate',
                    textEditingController: textEditingControllerRate,
                    isError: providerListen.error,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  10.getH(),
                  DropdownMenu<String>(
                    selectedTrailingIcon: Icon(Icons.category),
                    label: Text(
                      "Category",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    width: width - 50,
                    initialSelection: "",
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        textCategory = value!;
                      });
                    },
                    dropdownMenuEntries: listCategory
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                  20.getH(),
                  DropdownMenu<String>(
                    selectedTrailingIcon: Icon(Icons.category),
                    label: Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    width: width - 50,
                    initialSelection: "",
                    onSelected: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        textGender = value!;
                      });
                    },
                    dropdownMenuEntries: listGender
                        .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                  ),
                ],
              ),
            ),
    );
  }
}
