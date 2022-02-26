import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  static String router = 'page_1';
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
