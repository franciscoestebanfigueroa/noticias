import 'package:flutter/material.dart';
import 'package:noticias/providers/providers.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderCustomBottonBar>(context);
    return BottomNavigationBar(
      currentIndex: provider.indexBotton,
      onTap: (value){
        provider.indexBotton=value;
      },
      items: const [
        BottomNavigationBarItem(
          
          label: '1',
          icon: Icon(Icons.abc),

        ),
        BottomNavigationBarItem(
          label: '2',
          icon: Icon(Icons.abc),
        ),
      ],
    );
  }
}
