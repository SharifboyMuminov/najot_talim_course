import 'package:flutter/cupertino.dart';

import '../data/model/messeg/message_model.dart';

class MessageViewModel extends ChangeNotifier {
  List<MessageModel> messages = [];

  addMessage({required MessageModel messageModel}) {

    messages.add(messageModel);
    debugPrint("${messages.length}");

    notifyListeners();
  }

  removeMessage({required MessageModel messageModel}) {
    messages.remove(messageModel);
    notifyListeners();
  }

  removeAll() {
    messages = [];
    notifyListeners();
  }
}
