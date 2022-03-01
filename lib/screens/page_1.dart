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

ScrollController scrollController = ScrollController();

class _Page1State extends State<Page1> {
  @override
  void initState() {
    scrollController.addListener(() {
      print(scrollController.position.maxScrollExtent);
      if ((scrollController.position.pixels) >
          (scrollController.position.maxScrollExtent - 500)) {
        print('pedir mas datos');
        //llamar a get y add a lista desectructurando con  _listapopular = [..._listapopular, ...modelPopular.results];
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(() {});
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerUrl = Provider.of<ProviderService>(context);

    return providerUrl.listadoNoticias.isEmpty
        ? ListView(
            controller: scrollController,
            children:
                List.generate(1000, (index) => Center(child: Text('$index'))),
          )
        // const _ListEmpty()
        : Container(
            margin: const EdgeInsets.all(10),
            child: ListView.builder(
                controller: scrollController,
                itemCount: providerUrl.listadoNoticias.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
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
                            placeholder:
                                const AssetImage('assets/no-image.png'),
                            image: imgdata(providerUrl, index),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(providerUrl.listadoNoticias[index].titulo,
                            style:
                                const TextStyle(fontWeight: FontWeight.w900)),
                        Text(
                          providerUrl.listadoNoticias[index].description ?? '',
                          maxLines: 2,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
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

class _ListEmpty extends StatelessWidget {
  const _ListEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no-image.png'),
          const SizedBox(
            height: 20,
          ),
          const Text('Servidor fuera de linea... ')
        ],
      ),
    );
  }
}
