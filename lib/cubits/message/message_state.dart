import 'package:default_project/data/models/messege/messege_model.dart';

class MessageState {
  List<MessageModel> messages;

  MessageState({required this.messages});

  MessageState copyWith({List<MessageModel>? messages}) {
    return MessageState(messages: messages ?? this.messages);
  }
}
