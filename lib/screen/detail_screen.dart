import 'package:flutter/material.dart';
import 'package:tourism_app/data_center/attraction_model.dart';

import '../widgets/detail_screen_description.dart';

class DetailSightScreen extends StatefulWidget {
  DetailSightScreen({required this.attractionPlace});

  final AttractionModel attractionPlace;

  @override
  State<DetailSightScreen> createState() => _DetailSightScreenState();
}

class _DetailSightScreenState extends State<DetailSightScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(widget.attractionPlace.image.first),
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
                        btnFuction: () {
                          Navigator.of(context).pop();
                        }),
                    buildAppbarButton(
                        icon:
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                        btnFuction: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        }),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildSlideView(
                    images: widget.attractionPlace.image[index],
                  );
                },
                itemCount: widget.attractionPlace.image.length,
              ),
            ),
            const DetailScreenDescriptionClass(),
          ],
        ),
      ),
    );
  }

  Widget buildSlideView({required images}) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage(images), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(images),
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildAppbarButton({icon, required VoidCallback btnFuction}) {
    return GestureDetector(
      onTap: btnFuction,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.white, blurRadius: 10, spreadRadius: 7),
          ],
        ),
        width: 60,
        height: 60,
        child: Icon(icon,size: 25,),
      ),
    );
  }
}
