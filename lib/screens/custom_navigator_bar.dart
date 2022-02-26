import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(label: '1', icon: Icon(Icons.abc)),
        BottomNavigationBarItem(label: '2', icon: Icon(Icons.abc)),
      ],
    );
  }
}
