import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data_center/attraction_place_data_provider.dart';

import '../data_center/attraction_model.dart';
import '../widgets/body_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late String searched = '';
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late final TextEditingController searchWord;
  late double _width, _height;
  late final FocusNode searchWordNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchWord = TextEditingController();
    searchWordNode = FocusNode();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  void dispose() {
    searchWord.dispose();
    searchWordNode.dispose();
    _tabController.dispose();
    super.dispose();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    final attractionSight = AttractionModel.attractionPlaces;

    List<String> searchTerms = [];
    final foodList = AttractionModel.attractionPlaces;

    foodList.map((e) => searchTerms.add(e.name)).toList();

    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(searched.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: _height * 0.8,
          child: Stack(
            children: [
              Column(
                children: [
                  buildHeaderBody(),
                  BodySection(
                      width: _width, attractionSiteList: attractionSight),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        const Text(
                          'Feeling Adventures?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Column(
                          children: [],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Provider.of<AttractionPlaceDataProvider>(context, listen: false)
                          .isShowing ==
                      true
                  ? Positioned(
                      top: 180,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.builder(
                          itemCount: matchQuery.length,
                          itemBuilder: (context, index) {
                            var result = matchQuery[index];

                            return result.isNotEmpty
                                ? ListTile(
                                    onTap: () {},
                                    title: Text(
                                      result,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: Text('No Recipe By Value Entered!'),
                                  );
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderBody() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    size: 35,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 20),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/8.jpg'),
                    ),
                  )
                ],
              )
            ],
          ),
          buildSearchArea(),
        ],
      ),
    );
  }

  Widget buildSearchArea() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: TextFormField(
            controller: searchWord,
            validator: (value) {
              if (value == null) {
                return 'search can\'t be empty';
              } else {
                return null;
              }
            },
            onChanged: (value) {
              setState(() {
                searched = value;
                setState(() {
                  searched = value;

                  if (value.isEmpty) {
                    FocusScope.of(context).unfocus();

                    Provider.of<AttractionPlaceDataProvider>(context,
                            listen: false)
                        .changer(!isVisible);
                  } else {
                    Provider.of<AttractionPlaceDataProvider>(context,
                            listen: false)
                        .changer(isVisible);
                  }
                  // print( Provider.of<FoodDataProvider>(context,listen: false).isShowing);
                });
                // print( Provider.of<FoodDataProvider>(context,listen: false).isShowing);
              });
            },
            onSaved: (savedValue) {},
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  // showSearch(
                  //     context: context,
                  //     // delegate to customize the search bar
                  //     delegate: CustomSearchDelegate()
                  // );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
