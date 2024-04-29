import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/cubits/chat/chat_cubit.dart';
import 'package:default_project/data/models/messege/messege_model.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/streams/chat_room.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen(
      {super.key, required this.myUserModel, required this.userModel});

  final UserModel myUserModel;
  final UserModel userModel;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        title: Text(
          widget.userModel.fullName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Container(
          margin: EdgeInsets.only(left: 10.we),
          alignment: Alignment.center,
          // width: 50.we,
          // height: 50.we,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
            image: widget.userModel.imageUrl.isNotEmpty
                ? DecorationImage(
                    image: NetworkImage(widget.userModel.imageUrl),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: widget.userModel.imageUrl.isEmpty
              ? Text(
                  widget.userModel.fullName[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : null,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height - 180.he,
              child: StreamBuilder<QuerySnapshot>(
                stream: ChatRoomStream.chatRoomStream(
                    myDocId: widget.myUserModel.docId,
                    docId: widget.userModel.docId),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text("Error :("));
                  }

                  if (snapshot.hasData) {
                    List<MessageModel> messageModels = snapshot.data!.docs
                        .map((e) => MessageModel.fromJson(e))
                        .toList();

                    return ListView.builder(
                      reverse: true,
                      itemCount: messageModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        bool isMyMessage = widget.myUserModel.docId ==
                            messageModels[index].isMyMessage;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: isMyMessage
                                  ? Alignment.centerRight
                                  : Alignment.bottomLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: isMyMessage ? 90.we : 10.we,
                                    right: isMyMessage ? 10.we : 90.we,
                                    bottom: 10.he,
                                    top: 10.he),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.we, vertical: 20.he),
                                decoration: BoxDecoration(
                                  borderRadius: isMyMessage
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(15.r),
                                          topRight: Radius.circular(15.r),
                                          bottomLeft: Radius.circular(15.r),
                                        )
                                      : BorderRadius.only(
                                          topLeft: Radius.circular(15.r),
                                          topRight: Radius.circular(15.r),
                                          bottomRight: Radius.circular(15.r),
                                        ),
                                  color:
                                      isMyMessage ? Colors.white : Colors.blue,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 30,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  messageModels[index].messageText,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: isMyMessage
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.we),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.we, vertical: 15.he),
                        hintText: "Waiting...",
                        hintStyle: TextStyle(
                          color: const Color(0xFFADB5BD),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF7F7FC),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Color(0xFFF7F7FC),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            width: 1.w,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (textEditingController.text.isNotEmpty) {
                        FieldValue.serverTimestamp();
                        DateTime dateTime = DateTime.now();
                        MessageModel messageModel = MessageModel(
                          createdTime: "${dateTime.hour}:${dateTime.minute}",
                          messageText: textEditingController.text,
                          messageId: "",
                          isMyMessage: widget.myUserModel.docId,
                        );

                        context.read<ChatCubit>().addMessage(
                              messageModel: messageModel,
                              myDocId: widget.myUserModel.docId,
                              docId: widget.userModel.docId,
                            );
                        textEditingController.text = "";
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
