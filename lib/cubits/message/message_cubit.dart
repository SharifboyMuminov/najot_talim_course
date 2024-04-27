import 'package:default_project/cubits/message/message_state.dart';
import 'package:default_project/data/local/local_varibals.dart';
import 'package:default_project/data/models/messege/messege_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState(messages: messageModels));

  insertMessage({required MessageModel messageModel}) {
    List<MessageModel> a = state.messages;
    a.add(messageModel);
    emit(state.copyWith(messages: a));
  }

  removeMessage({required MessageModel messageModel}) {
    List<MessageModel> a = state.messages;
    a.remove(messageModel);
    emit(state.copyWith(messages: a));
  }

  sortMessage({required int contactId}) {
    List<MessageModel> a = state.messages.where((element) {
      if (contactId == element.messageId) {
        // debugPrint(contactId.toString());
        // debugPrint(element.messageId.toString());

        return true;
      }
      return false;
    }).toList();
    return a;
  }
}
