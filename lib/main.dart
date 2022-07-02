//import '/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:login_page/controllers/login_controller.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:login_page/pages/LoginPage.dart';
import 'package:provider/provider.dart';

void main () async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginController(),
      child: LoginPagez(),
      )
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPagez(),
      ),
    );
  }
}
