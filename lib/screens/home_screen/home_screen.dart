import 'package:default_project/data/models/user/user_model.dart';
import 'package:default_project/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Actior",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
      body: context.watch<UserView>().users.isNotEmpty
          ? ListView(
              children: [
                ...List.generate(
                  context.watch<UserView>().users.length,
                  (index) {
                    UserModel userModel =
                        context.watch<UserView>().users[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                        leading: Image.network(
                          userModel.avatarUrl,
                        ),
                        title: Text(userModel.name),
                      ),
                    );
                  },
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
    );
  }
}
