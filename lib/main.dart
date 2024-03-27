import 'package:default_project/screens/splash/splash_creen.dart';
import 'package:default_project/view/authe_view.dart';
import 'package:default_project/view/categoriy_view.dart';
import 'package:default_project/view/image_view.dart';
import 'package:default_project/view/login_view.dart';
import 'package:default_project/view/message_view.dart';
import 'package:default_project/view/product_view.dart';
import 'package:default_project/view/request_view.dart';
import 'package:default_project/view/tab_view.dart';
import 'package:default_project/view/user_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'services/firebase_options.dart';
import 'services/local_notification_service.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(
      "BACKGROUND MODE DA PUSH NOTIFICATION KELDI:${message.notification!.title}");
}

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.instance.subscribeToTopic("users");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => TabViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => MessageViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()..getUsers()),
        ChangeNotifierProvider(create: (_) => ImageViewModel()),
        ChangeNotifierProvider(
            create: (_) => ProductViewModel()..getProducts()),
        ChangeNotifierProvider(
            create: (_) => CategoryViewModel()..getCategories()),
        ChangeNotifierProvider(
            create: (_) => RequestViewModel()..getProducts()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    LocalNotificationService.localNotificationService.init(navigatorKey);

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
