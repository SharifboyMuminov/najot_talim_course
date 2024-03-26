import 'dart:convert';
import 'dart:io';

import 'package:default_project/utils/app_contans.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<String> sendNotificationToUsers({
    String? topicName,
    String? fcmToken,
    required String title,
    required String body,
  }) async {
    try {
      debugPrint("DATA:$fcmToken");

      http.Response response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: {
          "Authorization": "key=${AppConstants.messageKey}",
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "to": topicName != null ? "/topics/$topicName" : fcmToken,
            "notification": {
              "title": title,
              "body": body,
              "sound": "default",
              "priority": "high"
            },
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return response.body.toString();
      }
    } catch (err) {
      debugPrint(err.toString());
    }

    return "ERROR";
  }
}
