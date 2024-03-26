import 'package:default_project/data/api_provider/api_provider.dart';
import 'package:default_project/data/model/user/user_model.dart';
import 'package:default_project/screens/widget/text_input.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendMessageScreen extends StatefulWidget {
  SendMessageScreen({super.key, this.isAll = false, this.userModel});

  UserModel? userModel;
  final bool isAll;

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  bool error = false;
  TextEditingController textEditingControllerTitle = TextEditingController();
  TextEditingController textEditingControllerBody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Users Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (textEditingControllerBody.text.isEmpty &&
                  textEditingControllerTitle.text.isEmpty) {
                error = true;
                setState(() {});
              } else {
                ApiProvider.sendNotificationToUsers(
                  topicName: widget.isAll ? "users" : null,
                  fcmToken: widget.userModel?.tokenId,
                  title: textEditingControllerTitle.text,
                  body: textEditingControllerBody.text,
                );
              }
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 20.he),
        child: Column(
          children: [
            TextInputMyWidget(
              label: "Title",
              textEditingController: textEditingControllerTitle,
              isError: error,
            ),
            10.getH(),
            TextInputMyWidget(
              label: "Body",
              textEditingController: textEditingControllerBody,
              isError: error,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
      ),
    );
  }
}
