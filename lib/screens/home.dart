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
    print(indiceBotton.indexBotton);
    return Scaffold(
      body: indiceBotton.indexBotton == 0 ? Page2() : Page1(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final x =
              Provider.of<ProviderCustomBottonBar>(context, listen: false);
          if (x.indexBotton == 0) {
            x.indexBotton = 1;
          } else {
            x.indexBotton = 0;
          }
        },
      ),
    );
  }
}
