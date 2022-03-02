import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/model_notice.dart';

class ProviderService extends ChangeNotifier {
  List<Articles> listadoNoticias = [];
int page=0;
  ProviderService() {
    getNotice();
  }

  Future getNotice() async {
     String uri =
        'https://newsapi.org/v2/top-headlines?country=ar&apiKey=70df0e4d3b9b4c83b6ce6a0080b3c170&page=${page.toString()}';
    Uri url = Uri.parse(uri);
    http.Response response = await http.get(url);

    Map<String, dynamic> mapaNotice = jsonDecode(response.body);

    final x = Data.fromjson(mapaNotice);
    listadoNoticias.addAll(x.articles);
    print(listadoNoticias[0].url);
page++;
    notifyListeners();
  }
}
