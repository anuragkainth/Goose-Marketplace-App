import 'package:flutter/material.dart';
import 'package:marketplace_app/constants/theme.dart';
import 'package:marketplace_app/pages/auth_page.dart';
import 'package:marketplace_app/pages/create_account_page.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketplace_app/pages/discover_page.dart';
import 'package:marketplace_app/pages/sign_in_page.dart';
import 'package:marketplace_app/utilities/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.messengerKey,
      theme: darkTheme,
      home: AuthPage(),
    );
  }
}
