import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data_center/attraction_place_data_provider.dart';
import 'package:tourism_app/screen/front_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AttractionPlaceDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FrontScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
