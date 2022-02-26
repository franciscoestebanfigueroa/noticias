import 'package:flutter/material.dart';

class ProviderCustomBottonBar extends ChangeNotifier {
  int _indexBotton = 0;

  int get indexBotton => _indexBotton;
  set indexBotton(int value) {
    _indexBotton = value;
    // print(value);
    notifyListeners();
  }
}
