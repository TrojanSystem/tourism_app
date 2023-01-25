import 'package:flutter/material.dart';
class TabBarElement extends StatelessWidget {
  const TabBarElement({
    Key? key,
    required double width,
  }) : _width = width, super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
                20, 10, 10, 10),
            width: _width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
              borderRadius:
              BorderRadius.circular(25),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/back.jpg'),
              ),
            ),
          ),
          const Positioned(
            bottom: 80,
            left: 50,
            child: Text(
              'Amazon Forest',
              style: TextStyle(
                fontFamily: 'SofiaSans-Bold',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}