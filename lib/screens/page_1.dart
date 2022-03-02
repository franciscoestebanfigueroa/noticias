import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_services.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

class Page1 extends StatefulWidget {
  static String router = 'page_1';
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}
ScrollController _controller=ScrollController();
class _Page1State extends State<Page1> {
@override
  void initState() {
    _controller.addListener(() { 
      if(_controller.position.pixels>_controller.position.maxScrollExtent-500) ;
      {final x =Provider.of<ProviderService>(context,listen: false);
      print(x.page);
      print(_controller.position.pixels);
    x.getNotice();}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerUrl = Provider.of<ProviderService>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
          controller: _controller,
          itemCount: providerUrl.listadoNoticias.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    body: DetalleNoticias(
                        articles: providerUrl.listadoNoticias[index]),
                  );
                }));
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const NetworkImage(
                          'https://via.placeholder.com/100x100/'),
                      image: imgdata(providerUrl, index),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(providerUrl.listadoNoticias[index].titulo,
                      style: const TextStyle(fontWeight: FontWeight.w900)),
                  Text(
                    providerUrl.listadoNoticias[index].description ?? '',
                    maxLines: 2,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  const Divider(),
                ],
              ),
            );
          }),
    );
  }

  NetworkImage imgdata(ProviderService providerUrl, int index) {
    if (providerUrl.listadoNoticias[index].urlImage == '') {
      return NetworkImage('https://via.placeholder.com/300x100/');
    } else {
      return NetworkImage(providerUrl.listadoNoticias[index].urlImage!);
    }
  }
}
