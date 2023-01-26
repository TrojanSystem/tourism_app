import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data_center/attraction_place_data_provider.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      initialSelectedTab: "Home",
      useSafeArea: true,
      // default: true, apply safe area wrapper
      labels: const ["Home", "Search", "Bookmark", "Profile"],
      icons: const [Icons.home, Icons.search, Icons.bookmark, Icons.person],

      // optional badges, length must be same with labels
      badges: [
        // Default Motion Badge Widget
        const MotionBadgeWidget(
          text: '99+',
          textColor: Colors.white, // optional, default to Colors.white
          color: Colors.red, // optional, default to Colors.red
          size: 18, // optional, default to 18
        ),

        // custom badge Widget
        Container(
          color: Colors.black,
          padding: const EdgeInsets.all(2),
          child: const Text(
            '48',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),

        // allow null
        null,

        // Default Motion Badge Widget with indicator only
        const MotionBadgeWidget(
          isIndicator: true,
          color: Colors.red, // optional, default to Colors.red
          size: 5, // optional, default to 5,
          show: true, // true / false
        ),
      ],
      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: Colors.blue[600],
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: Colors.blue[900],
      tabIconSelectedColor: Colors.white,
      tabBarColor: Colors.white,
      onTabItemSelected: (int value) {
        setState(() {
          _tabController!.index = value;
          Provider.of<AttractionPlaceDataProvider>(context, listen: false)
              .screenChanger(value);
          value;
        });
      },
    );
  }
}
