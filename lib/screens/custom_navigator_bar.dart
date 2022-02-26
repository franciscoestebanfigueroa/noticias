import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      child: Container(
        color: Colors.blueGrey,
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.live_tv_sharp)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.live_tv_sharp))
          ],
        ),
      ),
    );
  }
}
