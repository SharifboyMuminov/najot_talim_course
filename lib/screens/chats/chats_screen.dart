import 'package:default_project/cubits/message/message_cubit.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/contact/contact.dart';
import 'package:default_project/data/models/messege/messege_model.dart';
import 'package:default_project/screens/message/message_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Conversations",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chat,
              color: Colors.black,
              size: 14.sp,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allContacts.length,
        itemBuilder: (BuildContext context, int index) {
          ContactModel contactModel = allContacts[index];
          return TextButton(
            style: TextButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.we, vertical: 8.he),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MessageScreen(
                      contactModel: contactModel,
                    );
                  },
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.network(contactModel.imageUrl, width: 70)),
                SizedBox(width: 12.we),
                Column(
                  children: [
                    Text(
                      "${contactModel.contactLasName} ${contactModel.contactName}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
