import 'package:flutter/material.dart';
import 'package:noticias/models/model_notice.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleNoticias extends StatelessWidget {
  final Articles articles;

  const DetalleNoticias({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.titulo),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: (articles.urlImage == '')
                    ? Container(
                        color: Colors.indigo,
                      )
                    : Image.network(
                        articles.urlImage!,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(articles.titulo),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    articles.content!.length > 200
                        ? articles.content?.substring(0, 200) ?? ''
                        : articles.content ?? '',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              TextButton(
                  onPressed: articles.url != null
                      ? () => _launchURL(articles.url!)
                      : null,
                  child: const Text('Leer mas..'))
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
