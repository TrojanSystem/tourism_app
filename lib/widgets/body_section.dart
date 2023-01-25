import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/tabbar_element.dart';

class BodySection extends StatelessWidget {
  const BodySection({
    Key? key,
    required double width,
  }) : _width = width, super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 3.0,
              //   controller: _tabController,
              indicatorPadding: EdgeInsets.only(top: 10),
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              tabs: [
                Tab(
                  child: Text(
                    'Sights',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Tour',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    'Adventures',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
              padding: EdgeInsets.only(bottom: 10),
            ),
          ),
          Expanded(
            child: TabBarView(
              // controller: _tabController,
              children: [
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => TabBarElement(width: _width),
                    itemCount: 3),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.red,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

