import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:noticias/models/ejemplomodel.dart';
import 'package:noticias/models/model_category.dart';
import 'package:noticias/models/model_notice.dart';

class ProviderService extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  //String _apiKey = '431a2b39236d43baaafbf67530faa12d';
  String _apiKey = '208c4735550b42a8a31633529958a88f';
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
  String _country = 'ar';

  ProviderService() {
    getNotice();
  }

  String get country => _country;
  set country(String value) {
    _country = value;
    listadoNoticias = [];

    //listadoNoticias.clear;
    notifyListeners();
    getBusqueda('business');
    print(_country);
    notifyListeners();
  }

  Future getBusqueda(String category) async {
    //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
//https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=208c4735550b42a8a31633529958a88f
    String authority = 'newsapi.org';
    String unencodedPath = 'v2/top-headlines';
    Map<String, dynamic> q = {
      'country': _country,
      'apiKey': _apiKey,
      'page': '0',
      'category': category
    };

    Uri url = Uri.https(authority, unencodedPath, q);
    http.Response response = await http.get(url);
    print(response.statusCode);
    var dataDecode = jsonDecode(response.body);
    print(dataDecode);
    var data = Data.fromjson(dataDecode);
    print(' total de resultados ${data.totalResults.toString()}');

    //if(data.totalResults){}
    listadoNoticias.clear();
    listadoNoticias.addAll(data.articles);
    notifyListeners();
  }

  Future<List<Articles>> getNotice() async {
    const String uri =
        'https://newsapi.org/v2/top-headlines?country=ar&apiKey=208c4735550b42a8a31633529958a88f';

    Uri url = Uri.https(
      'newsapi.org',
      '/v2/top-headlines',
      {'country': _country, 'apiKey': _apiKey, 'page': page.toString()},
    );
    //Uri url = Uri.parse(uri);
    http.Response response = await http.get(url);
    print('estatus response ${response.statusCode}');
    if (response.statusCode != 200) {
      print(jsonDecode(response.body)['status']);
      print(jsonDecode(response.body)['message']);
      _apiKey = '431a2b39236d43baaafbf67530faa12d';
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
