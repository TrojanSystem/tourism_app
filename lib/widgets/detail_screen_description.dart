import 'package:flutter/material.dart';

class DetailScreenDescriptionClass extends StatelessWidget {
  const DetailScreenDescriptionClass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        child: Column(
          children: [
            buildDetailHeader(),
            buildDetailScreenBody(),
          ],
        ),
      ),
    );
  }

  Expanded buildDetailScreenBody() {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Stack(
          children: [
            buildDetailScreenBodyTabBar(),
            buildDetailScreenBodyButton()
          ],
        ),
      ),
    );
  }

  Container buildDetailScreenBodyButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: const [
            BoxShadow(color: Colors.white, blurRadius: 10, spreadRadius: 7),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Book Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Column buildDetailScreenBodyTabBar() {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(
              child: Text(
                'Overview',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Tab(
              child: Text(
                'Reviews',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          indicatorColor: Colors.black,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        Expanded(
          child: TabBarView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildOverviewButton(
                            icon: Icons.access_time,
                            text: 'Duration',
                            subText: '3 Hours'),
                        buildOverviewButton(
                            icon: Icons.star_border_outlined,
                            text: 'Rating',
                            subText: '4.5 / 5'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.0),
                    child: Text(
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.justify,
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          ),
        )
      ],
    );
  }

  Widget buildOverviewButton({icon, text, subText}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.grey),
            ),
            child: Icon(icon),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subText,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildDetailHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28.0, 28, 28, 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Destruction \n Valley',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '\$195',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                  text: '/person',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
