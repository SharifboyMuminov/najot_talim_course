import 'package:default_project/data/models/contact/contact.dart';
import 'package:default_project/data/models/messege/messege_model.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {super.key, required this.contactModel, required this.messages});

  final ContactModel contactModel;
  final List<MessageModel> messages;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 25.sp,
          ),
        ),
        title: Text(
          "${widget.contactModel.contactName} ${widget.contactModel.contactLasName}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.messages.length,
        itemBuilder: (BuildContext context, int index) {
          MessageModel messageModel = widget.messages[index];
          if (messageModel.contactId != 111) {
            return Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
                  padding: const EdgeInsets.all(20),
                  width: width - 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0xFFD84D4D),
                  ),
                  child: Text(
                    messageModel.messageText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                    size: 25.sp,
                  ),
                ),
              ],
            );
          }

          return Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                  size: 25.sp,
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 20.we, vertical: 10.he),
                padding: const EdgeInsets.all(20),
                width: width - 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: Text(
                  messageModel.messageText,
                  style: TextStyle(
                    color: Color(0xFF595F69),
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
