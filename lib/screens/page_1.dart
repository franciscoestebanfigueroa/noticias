import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_services.dart';
import 'package:provider/provider.dart';

class Page1 extends StatelessWidget {
  static String router = 'page_1';
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerUrl = Provider.of<ProviderService>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: providerUrl.listadoNoticias.length,
          itemBuilder: (context, index) {
            return Column(
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
