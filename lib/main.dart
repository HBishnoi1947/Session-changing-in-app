import 'package:flutter/material.dart';
import 'package:session/detail.dart';
import 'package:session/home.dart';
import 'package:session/page_routes.dart';
import 'package:session/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        Page_Routes.home:(context) => const MyHome()
      },
    );
  }
}

