import 'package:flutter/material.dart';
import 'package:news_app/my_theme_data.dart';

import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName :(Context)=>HomeScreen(),
      },
    );
  }
}