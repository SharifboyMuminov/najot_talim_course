import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/data/local/storage_repository.dart';
import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/streams/user_stream.dart';
import 'package:default_project/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late UserModel myUserModel;

  @override
  void initState() {
    myUserModel = widget.userModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: myUserModel.imageUrl.isNotEmpty
            ? Container(
                width: 10.we,
                height: 10.we,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(myUserModel.imageUrl),
                  ),
                ),
              )
            : null,
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
            onPressed: () {
              StorageRepository.setString(key: "doc_id", value: "");
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: UserStream.userStream(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasError) {
            return Text(
              "Error connect :(",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            );
          }
          if (snapshot.hasData) {
            List<UserModel> userModelsData = snapshot.data!.docs
                .map((e) => UserModel.fromJson(UserModel.getMapUser(e)))
                .toList();
            // debugPrint(userModelsData.length.toString());
            userModelsData
                .removeWhere((element) => element.docId == myUserModel.docId);

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 30.he),
              itemCount: userModelsData.length,
              itemBuilder: (BuildContext context, int index) {
                UserModel userModel = userModelsData[index];
                return Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 65.we,
                            height: 65.we,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                              image: userModel.imageUrl.isNotEmpty
                                  ? DecorationImage(
                                      image: NetworkImage(userModel.imageUrl),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: userModel.imageUrl.isEmpty
                                ? Text(
                                    userModel.fullName[0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : null,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.we, vertical: 15.he),
                            child: Text(
                              userModel.fullName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 2.he,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
