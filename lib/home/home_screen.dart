import 'package:flutter/material.dart';
import 'package:newnews_app/api/api_manager.dart';
import 'package:newnews_app/app_colors.dart';
import 'package:newnews_app/home/category/category_details.dart';
import 'package:newnews_app/home/category/category_fragment.dart';
import 'package:newnews_app/home/drawer/home_drawer.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container( //background image
          color: AppColors.whiteColor,
          child: Image.asset('assets/images/background_pattern.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(context).textTheme.titleLarge,
            )

          ),
          drawer: Drawer(
            child: HomeDrawer(),
          ),
          body: CategoryFragment()
        )
      ],
    );
  }
}
