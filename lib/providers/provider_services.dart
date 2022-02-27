import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/model_notice.dart';

class ProviderService extends ChangeNotifier {
  List<ModelNotice> listadoNoticias = [];

  Future getNotice() async {
    const String uri =
        'https://newsapi.org/v2/top-headlines?country=ar&apiKey=208c4735550b42a8a31633529958a88f';
    Uri url = Uri.parse(uri);
    http.Response response = await http.get(url);
    // print(response.body);

    var mapaNotice = jsonDecode(response.body);

    for (int i = 0; i < mapaNotice['articles'].length; i++) {
      listadoNoticias.add(ModelNotice.fromJson(mapaNotice['articles'][i]));
    }
    notifyListeners();
  }
}
