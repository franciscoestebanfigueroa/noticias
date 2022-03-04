import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noticias/providers/provider_services.dart';
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
    return Container(
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.category.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(provider.category[index].categoria
                                .toUpperCase()),
                          ),
                        ],
                      )),
                ],
              );
            }));
  }
}

class _CardNoticias extends StatelessWidget {
  const _CardNoticias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  FadeInImage(
                      placeholder: AssetImage('assets/no-image.png'),
                      image: AssetImage('assets/no-image.png')),
                  Text('hola'),
                ],
              ),
            ));
          }),
    );
  }
}
