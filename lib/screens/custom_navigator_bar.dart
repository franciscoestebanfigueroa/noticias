import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/providers/providers.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderCustomBottonBar>(context);
    return BottomNavigationBar(
      currentIndex: provider.indexBotton,
      onTap: (value) {
        provider.indexBotton = value;
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Noticias Principales',
          icon: Icon(FontAwesomeIcons.circleNotch),
        ),
        BottomNavigationBarItem(
          label: 'Noticias por Categotias',
          icon: Icon(FontAwesomeIcons.search),
        ),
      ],
    );
  }
}
