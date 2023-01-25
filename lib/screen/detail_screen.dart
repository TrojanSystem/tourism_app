import 'package:flutter/material.dart';

class DetailSightScreen extends StatelessWidget {
  const DetailSightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/images (1).jpeg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 50, 18, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAppbarButton(
                      icon: Icons.arrow_back_ios_new_rounded,
                    ),
                    buildAppbarButton(
                      icon: Icons.favorite_border,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.4),
              ),
              width: 300,
              height: 80,
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  buildSlideView() ,
                  buildSlideView() ,buildSlideView() ,buildSlideView() ,
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildSlideView() {
    return Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/images/image.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                );
  }

  Widget buildAppbarButton({icon}) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 10, spreadRadius: 7),
        ],
      ),
      width: 60,
      height: 60,
      child: Icon(icon),
    );
  }
}
