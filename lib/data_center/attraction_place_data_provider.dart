import 'package:flutter/cupertino.dart';

class AttractionPlaceDataProvider extends ChangeNotifier {
  int currentScreenIndex = 0;

  void screenChanger(int value) {
    currentScreenIndex = value;
    notifyListeners();
  }
}
