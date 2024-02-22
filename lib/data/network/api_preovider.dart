import 'dart:convert';

import 'package:default_project/screens/moduls/game_modul.dart';
import 'package:http/http.dart' as http;

import '../moduls/network_response.dart';

class ApiPreovider {
  Future<NetworRespon> fitchGames() async {
    http.Response response;
    NetworRespon networRespon = NetworRespon();

    try {
      response =
          await http.get(Uri.parse("https://valorant-api.com/v1/agents"));

      if (response.statusCode == 200) {
        networRespon.data = (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => GameModul.fromJson(e))
                .toList() ??
            [];
      } else {
        networRespon.errorText = "Error";
      }
    } catch (error) {
      networRespon.errorText = "Error catch";
    }

    return networRespon;
  }
}
