import 'package:default_project/data/model/messeg/message_model.dart';
import 'package:default_project/data/model/user/user_model.dart';
import 'package:default_project/screens/users/send_message_screen.dart';
import 'package:default_project/services/local_notification_service.dart';
import 'package:default_project/view/message_view.dart';
import 'package:default_project/view/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<UserViewModel>().getUsers();
    });
    super.initState();
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return  SendMessageScreen(isAll: true);
                  },
                ),
              );
            },
            icon: const Icon(Icons.sms),
          ),
        ],
      ),
      body: context.watch<UserViewModel>().loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.red,
              ),
            )
          : ListView(
              children: List.generate(
                context.watch<UserViewModel>().users.length,
                (index) {
                  UserModel userModel =
                      context.watch<UserViewModel>().users[index];
                  return ListTile(
                    title: Text(userModel.email),
                    subtitle: Text(userModel.password),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return  SendMessageScreen(
                                  userModel: userModel);
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.chat),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
