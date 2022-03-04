import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/model_category.dart';
import 'package:noticias/models/model_notice.dart';

class ProviderService extends ChangeNotifier {
  ScrollController scrollController = ScrollController();

  List<Articles> listadoNoticias = [];
  List<Categorias> category = [
    Categorias(FontAwesomeIcons.building, 'business'),
    Categorias(FontAwesomeIcons.tv, 'entertainment'),
    Categorias(FontAwesomeIcons.addressCard, 'general'),
    Categorias(FontAwesomeIcons.headSideVirus, 'health'),
    Categorias(FontAwesomeIcons.vials, 'science'),
    Categorias(FontAwesomeIcons.volleyballBall, 'sports'),
    Categorias(FontAwesomeIcons.memory, 'technology'),
  ];
  int page = 0;

  ProviderService() {
    getNotice();
  }


Future getBusqueda(String category)async{
 //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

    String authority='newsapi.org';
    String unencodedPath='v2/top-headlines/sources';
    Map<String,dynamic>q={
      'country': 'ar',
        'apiKey': '208c4735550b42a8a31633529958a88f',
        'page':'0',
        'category':category

    };

  Uri url = Uri.https(authority, unencodedPath,q);
  http.Response response = await http.get(url);
  print(response.statusCode); 
  print(response.body);
  



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
