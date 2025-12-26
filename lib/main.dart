import 'package:flutter/material.dart';
import 'package:newnews_app/my_theme_data.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

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