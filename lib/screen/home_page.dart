import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/body_section.dart';
import '../widgets/bottom_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _tabController;
  late final TextEditingController searchWord;
  late double _width, _height;
  late final FocusNode searchWordNode;

  late String searched = '';

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

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(246, 245, 248, 1),
        body: SafeArea(
          child: Column(
            children: [
              buildHeaderBody(),
              BodySection(width: _width),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,

                ),
              ),
            ],
          ),
        ),
       bottomNavigationBar:BottomTabBar(),
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
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(8),
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
