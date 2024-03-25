import 'package:default_project/data/model/messeg/message_model.dart';
import 'package:default_project/services/local_notification_service.dart';
import 'package:default_project/view/message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Message Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<MessageViewModel>().removeAll();
              LocalNotificationService.localNotificationService.cancelAll();

            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: ListView(
        children: List.generate(
          context.watch<MessageViewModel>().messages.length,
          (index) {
            MessageModel messageModel =
                context.watch<MessageViewModel>().messages[index];
            return ListTile(
              title: Text(messageModel.name),
              subtitle: Text(messageModel.id.toString()),
              trailing: IconButton(
                onPressed: () {
                  LocalNotificationService.localNotificationService.cancelNotification(messageModel.id);
                  context.read<MessageViewModel>().removeMessage(messageModel: messageModel);

                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }
}
