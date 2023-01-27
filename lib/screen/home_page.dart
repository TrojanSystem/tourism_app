
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tourism_app/screen/bookmark_screen.dart';
import 'package:tourism_app/screen/profile_screen.dart';
import 'package:tourism_app/screen/search_screen.dart';

import '../data_center/attraction_place_data_provider.dart';

import '../widgets/bottom_tab_bar.dart';
import 'main_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {



  List screenWidget = [
    const MainScreen(),
    const SearchScreen(),
    const BookmarkScreen(favoriteList: [],),
    const ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
   final currentScreenIndex = Provider.of<AttractionPlaceDataProvider>(context).currentScreenIndex;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(246, 245, 248, 1),
        body:screenWidget[currentScreenIndex],
        bottomNavigationBar: const BottomTabBar(),
      ),
    );
  }


}
