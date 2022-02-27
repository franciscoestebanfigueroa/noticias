import 'package:flutter/material.dart';
import 'package:noticias/providers/providers.dart';
import 'package:noticias/screens/screens.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indiceBotton =
        Provider.of<ProviderCustomBottonBar>(context, listen: true);
    final controlerPage=indiceBotton.pagecontroler;
    return Scaffold(
      body: _Body(controlerPage:controlerPage),
      bottomNavigationBar: const CustomNavigatorBar(),
      
      
    );
  }
}
class _Body extends StatelessWidget {
PageController controlerPage;
  _Body({ Key? key, required this.controlerPage }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controlerPage,
children: const[
  Page1(),
  Page2()
],

    );
      
  }
}