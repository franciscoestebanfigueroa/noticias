import 'package:flutter/material.dart';

class ProviderCustomBottonBar extends ChangeNotifier {
  int _indexBotton = 0;
  final PageController _pageController = PageController();

  PageController get pagecontroler => _pageController;

  int get indexBotton => _indexBotton;
  set indexBotton(int value) {
    _indexBotton = value;
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 350),
      curve: Curves.bounceOut,
    );
    // print(value);
    notifyListeners();
  }
}
