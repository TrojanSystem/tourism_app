import 'package:flutter/material.dart';
import 'package:tourism_app/data_center/attraction_model.dart';
import 'package:tourism_app/screen/detail_screen.dart';

class TabBarElement extends StatelessWidget {
  const TabBarElement({
    required this.attractionPlace,
    required double width,
  })  : _width = width;

  final double _width;
  final AttractionModel attractionPlace;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>  DetailSightScreen(attractionPlace:attractionPlace),
          ),
        );
      },
      child: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              width: _width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(25),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(attractionPlace.image.first),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
             Positioned(
              bottom: 80,
              left: 50,
              child: Text(
                attractionPlace.name,
                style:const TextStyle(
                  fontFamily: 'SofiaSans-Bold',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
