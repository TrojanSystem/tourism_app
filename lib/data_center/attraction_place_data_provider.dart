import 'package:flutter/cupertino.dart';

class AttractionPlaceDataProvider extends ChangeNotifier {
  int currentScreenIndex = 0;

  void screenChanger(int value) {
    currentScreenIndex = value;
    notifyListeners();
  }
  bool isShowing = false;

  void changer(bool isShow) {
    isShowing = !isShow;
    notifyListeners();
  }
}
