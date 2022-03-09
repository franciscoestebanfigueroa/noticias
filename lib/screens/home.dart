import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_services.dart';
import 'package:noticias/providers/providers.dart';
import 'package:noticias/screens/screens.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ProviderCustomBottonBar>(context, listen: true);
    final controlerPage = provider.pagecontroler;
    List<DropdownMenuItem<String>> listaDrop = const [
      DropdownMenuItem(
        child: Text('Argentina'),
        value: 'ar',
      ),
      DropdownMenuItem(
        child: Text('Maxico'),
        value: 'mx',
      ),
      DropdownMenuItem(
        child: Text('EEUU'),
        value: 'us',
      )
    ];
    final providerdata = Provider.of<ProviderService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          DropdownButton<String>(
            onChanged: (x) {
              providerdata.country = x ?? 'mx';
            },
            items: listaDrop,
            value: providerdata.country,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: _Body(controlerPage: controlerPage),
      bottomNavigationBar: const CustomNavigatorBar(),
      //  floatingActionButton: FloatingActionButton(
      //    onPressed: () async {
      //      final data = Provider.of<ProviderService>(context, listen: false);
      //      await data.getBusqueda('technology');
      //  },
      // ),
    );
  }
}

class _Body extends StatelessWidget {
  PageController controlerPage;
  _Body({Key? key, required this.controlerPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<ProviderService>(context);
    return PageView(
      controller: controlerPage,
      children: [
        Page1(providerService: providerdata),
        const Page2(),
      ],
    );
  }
}
