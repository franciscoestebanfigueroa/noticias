import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/model_notice.dart';

class ProviderService extends ChangeNotifier {
  List<Articles> listadoNoticias = [];

  ProviderService() {
    getNotice();
  }

  Future getNotice() async {
    const String uri =
        'https://newsapi.org/v2/top-headlines?country=ar&apiKey=208c4735550b42a8a31633529958a88f';
    Uri url = Uri.parse(uri);
    http.Response response = await http.get(url);

    Map<String, dynamic> mapaNotice = jsonDecode(response.body);

    final x = Data.fromjson(mapaNotice);
    listadoNoticias.addAll(x.articles);
    print(listadoNoticias[0].url);

    notifyListeners();
  }
}
