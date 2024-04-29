import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageId;
  final String messageText;
  final String createdTime;
  final String isMyMessage;

  MessageModel({
    required this.createdTime,
    required this.messageText,
    required this.messageId,
    required this.isMyMessage,
  });

  factory MessageModel.fromJson(QueryDocumentSnapshot user) {
    Map<String, dynamic> json = {
      "created_time": user["created_time"],
      "message_text": user["message_text"],
      "message_id": user["message_id"],
      "is_my_message": user["is_my_message"],
    };

    return MessageModel(
      createdTime: json["created_time"] as String? ?? "",
      messageText: json["message_text"] as String? ?? "",
      messageId: json["message_id"] as String? ?? "",
      isMyMessage: json["is_my_message"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "created_time": createdTime,
      "message_text": messageText,
      "message_id": messageId,
      "is_my_message": isMyMessage,
      "sort": FieldValue.serverTimestamp(),
    };
  }

  MessageModel copyWith({
    String? createdTime,
    String? messageText,
    String? messageId,
    String? isMyMessage,
  }) {
    return MessageModel(
      createdTime: createdTime ?? this.createdTime,
      messageText: messageText ?? this.messageText,
      messageId: messageId ?? this.messageId,
      isMyMessage: isMyMessage ?? this.isMyMessage,
    );
  }
}
