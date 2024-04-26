import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/contact/contact.dart';
import 'package:default_project/screens/message/message_screen.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.we),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(allContacts.length, (index) {
                ContactModel contactModel = allContacts[index];

                if (index == 0) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.we),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: Colors.grey, width: 2.we)),
                    child: Container(
                      width: 55.we,
                      height: 55.we,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.grey.withOpacity(0.3)),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 24.sp,
                      ),
                    ),
                  );
                }

                return SizedBox(
                  width: 80.we,
                  child: Column(
                    children: [
                      Container(
                        width: 70.we,
                        margin: EdgeInsets.symmetric(horizontal: 8.we),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: Colors.red, width: 2.we)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.network(
                              contactModel.imageUrl,
                              width: 55.we,
                              height: 55.we,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(
                        "${contactModel.contactName} ${contactModel.contactLasName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Container(
            width: width,
            height: 2,
            color: Colors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allContacts.length,
              itemBuilder: (BuildContext context, int index) {
                ContactModel contactModel = allContacts[index];

                return TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.we, vertical: 8.he),
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
                          child:
                              Image.network(contactModel.imageUrl, width: 70)),
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
          ),
        ],
      ),
    );
  }
}
