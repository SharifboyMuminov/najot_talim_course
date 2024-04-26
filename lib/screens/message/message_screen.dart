import 'package:default_project/cubits/message/message_cubit.dart';
import 'package:default_project/data/models/contact/contact.dart';
import 'package:default_project/data/models/messege/messege_model.dart';
import 'package:default_project/screens/message/widget/delte_button.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.contactModel});

  final ContactModel contactModel;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<MessageModel> messages = context
        .watch<MessageCubit>()
        .sortMessage(contactId: widget.contactModel.contactId);

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
      body: Column(
        children: [
          SizedBox(
            width: width,
            height: height - 210,
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  MessageModel messageModel = messages[index];
                  if (messageModel.contactId != 111) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.we, vertical: 10.he),
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
                        DeleteButton(
                          onTabDelete: () {
                            context
                                .read<MessageCubit>()
                                .removeMessage(messageModel: messageModel);

                            Navigator.pop(context);
                          },
                          onTabCopy: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      DeleteButton(
                        onTabDelete: () {
                          context
                              .read<MessageCubit>()
                              .removeMessage(messageModel: messageModel);
                          Navigator.pop(context);
                        },
                        onTabCopy: () {
                          Navigator.pop(context);
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.we, vertical: 10.he),
                        padding: const EdgeInsets.all(20),
                        width: width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Text(
                          messageModel.messageText,
                          style: TextStyle(
                            color: const Color(0xFF595F69),
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10.he),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 25.sp,
                  )),
              Expanded(
                child: TextField(
                    controller: textEditingController,
                    style: TextStyle(
                      color: const Color(0xFF0F1828),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "Type waiting ...",
                      hintStyle: TextStyle(
                        color: const Color(0xFFADB5BD),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF7F7FC),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          width: 0.w,
                          color: const Color(0xFFF7F7FC),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          width: 0.w,
                          color: const Color(0xFFF7F7FC),
                        ),
                      ),
                    )),
              ),
              IconButton(
                onPressed: () {
                  if (textEditingController.text.isNotEmpty) {
                    MessageModel messageModel = MessageModel(
                      createdTime: DateTime.now().toString(),
                      messageText: textEditingController.text,
                      messageId: widget.contactModel.contactId,
                      isFile: false,
                      contactId: 111,
                      status: false,
                    );
                    debugPrint(messageModel.messageId.toString());

                    context
                        .read<MessageCubit>()
                        .insertMessage(messageModel: messageModel);
                    textEditingController.text = "";
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: const Color(0xFFD84D4D),
                  size: 25.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
