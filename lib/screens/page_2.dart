import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_services.dart';
import 'package:noticias/screens/detalles_noticias.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  static String router = 'page_2';
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [_ListCategory(), _CardNoticias()],
      ),
      color: Colors.blue,
      width: double.infinity,
      height: 400,
    );
  }
}

class _ListCategory extends StatelessWidget {
  const _ListCategory();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderService>(context);
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.category.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.getBusqueda(provider.category[index].categoria);
                    },
                    child: Card(
                        color: Colors.transparent,
                        margin: const EdgeInsets.all(2),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(provider.category[index].icon),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(provider.category[index].categoria[0]
                                      .toUpperCase() +
                                  provider.category[index].categoria
                                      .substring(1)),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            }));
  }
}

class _CardNoticias extends StatelessWidget {
  const _CardNoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderService>(context);
    return Expanded(
      child: ListView.builder(
          itemCount: provider.listadoNoticias.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetalleNoticias(
                      articles: provider.listadoNoticias[index]);
                }));
              },
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    provider.listadoNoticias[index].urlImage != ''
                        ? FadeInImage(
                            placeholder:
                                const AssetImage('assets/no-image.png'),
                            image: NetworkImage(
                                provider.listadoNoticias[index].urlImage!,
                                scale: 2.5))
                        : Image.asset('assets/no-image.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(provider.listadoNoticias[index].titulo),
                  ],
                ),
              )),
            );
          }),
    );
  }
}
