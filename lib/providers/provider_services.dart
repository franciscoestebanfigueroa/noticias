import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/model_notice.dart';

class ProviderService extends ChangeNotifier {
  List<Articles> listadoNoticias = [];
  int page = 0;

  ProviderService() {
    getNotice();
  }

  Future<List<Articles>> getNotice() async {
    const String uri =
        'https://newsapi.org/v2/top-headlines?country=ar&apiKey=208c4735550b42a8a31633529958a88f';

    Uri url = Uri.https(
      'newsapi.org',
      '/v2/top-headlines',
      {
        'country': 'ar',
        'apiKey': '208c4735550b42a8a31633529958a88f',
        'page': page.toString()
      },
    );
    //Uri url = Uri.parse(uri);
    http.Response response = await http.get(url);
    print('estatus response ${response.statusCode}');
    if (response.statusCode == 429) {
      print(jsonDecode(response.body)['status']);
      print(jsonDecode(response.body)['message']);
    }

    if (response.statusCode == 200) {
      Map<String, dynamic> mapaNotice = jsonDecode(response.body);
      final x = Data.fromjson(mapaNotice);
      listadoNoticias.addAll(x.articles);
      // listadoNoticias = [...listadoNoticias, ...x.articles];
      //print(listadoNoticias.map(((e) => e.titulo)));
      // print('page $page');
      page++;
      notifyListeners();
    }
    return listadoNoticias;
  }
}
