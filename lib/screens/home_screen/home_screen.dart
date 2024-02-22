// import 'package:default_project/screens/moduls/game_modul.dart';
import 'package:default_project/screens/home_screen/info_screen.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  String text1 = '';
  String text2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (v) {
              text1 = v;
            },
          ),
          TextField(
            onChanged: (v) {
              text2 = v;
            },
          ),
          SizedBox(height: 30),
          TextButton(
            onPressed: () {
              if (sharedPreferences != null &&
                  text1.isNotEmpty &&
                  text2.isNotEmpty) {
                sharedPreferences!.setString("email", text1);
                sharedPreferences!.setString("password", text2);
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ),
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Future<List<GameModul>?> _getModels() async {
//     http.Response response;

//     try {
//       response =
//           await http.get(Uri.parse("https://www.freetogame.com/api/games"));

//       if (response.statusCode == 200) {
//         return (jsonDecode(response.body) as List?)
//                 ?.map((e) => GameModul.fromJson(e))
//                 .toList() ??
//             [];
//       }
//     } catch (error) {
//       throw Exception(error.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: _getModels(),
//         builder: (BuildContext context, AsyncSnapshot<List<GameModul>?> data) {
//           if (data.hasError) {
//             return Center(
//               child: Text("Erroe"),
//             );
//           } else if (data.data != null) {
//             List<GameModul> games = data.data as List<GameModul>;
//             return GridView.count(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 70),
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 15,
//               crossAxisCount: 2,
//               children: [
//                 ...List.generate(
//                   games.length,
//                   (index) {
//                     return Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(15.r),
//                           child: Image.network(games[index].thumbnail),
//                         ),
//                         SizedBox(height: 20),
//                         Text(games[index].title),
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator.adaptive(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
