import 'dart:io';

import 'package:default_project/screens/widget/shet_item.dart';
import 'package:default_project/utils/size.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:default_project/view/image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../data/local/local_varibalse.dart';
import '../../data/model/messeg/message_model.dart';
import '../../view/message_view.dart';
import '../widget/add_image_button.dart';
import '../widget/text_input.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController textEditingControllerCategoryName =
      TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  String imageUrl = "";
  String storagePath = "";
  XFile? xFile;

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
              if (xFile != null) {
                context.read<CategoryViewModel>().insertTest(
                      context,
                      nameCategory: textEditingControllerCategoryName.text,
                      imageUrl: imageUrl,
                      storagePath: 'files/${xFile!.name}',
                    );
                context.read<MessageViewModel>().addMessage(
                    messageModel: MessageModel(
                        name: "categoriy   Yngilandi Malumot qo'shildi",
                        id: idContLocal));
                idContLocal++;
              }
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
              textInputAction: TextInputAction.done,
            ),
            AddImageButton(
              onTab: () {
                _showBottomSheet();
              },
            ),
            if (!context.watch<ImageViewModel>().loading && xFile != null && imageUrl.isNotEmpty)
              Image.network(imageUrl),
            if (context.watch<ImageViewModel>().loading)
              const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }

  Future<void> _getImageFromCamera() async {
    xFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    Navigator.pop(context);

    if (xFile != null) {
      imageUrl = await context.read<ImageViewModel>().addImageInFireBase(
            file: File(xFile!.path),
            fileName: "files/${xFile!.name}",
          );
    }
  }

  Future<void> _getImageFromGallery() async {
    xFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    Navigator.pop(context);

    if (xFile != null) {
      imageUrl = await context.read<ImageViewModel>().addImageInFireBase(
            file: File(xFile!.path),
            fileName: "files/${xFile!.name}",
          );
    }
  }

  _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.he),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomshetItem(
                title: 'Camera',
                onTab: () async {
                  await _getImageFromCamera();
                },
                icons: Icons.camera_alt,
              ),
              BottomshetItem(
                title: "Gallery",
                onTab: () async {
                  await _getImageFromGallery();
                },
                icons: Icons.image,
              ),
            ],
          ),
        );
      },
    );
  }
}
