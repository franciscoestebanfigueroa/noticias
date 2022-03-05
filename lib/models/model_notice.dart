class Data {
  final String status;
  final int? totalResults;
  final List<Articles> articles;

  Data.fromjson(Map<String, dynamic> data)
      : status = data['status'],
        totalResults = data['totalResults']?? 0,
        articles = List<Articles>.from(
            data['articles']?.map((e) => Articles.fromjson(e))??[]);
}

class Articles {
  final Source source;
  final String titulo;
  final String? description;
  final String? url;
  final String? urlImage;
  final String? datePublished;
  final String? content;

  Articles.fromjson(Map<String, dynamic> json)
      : source = Source.fromjson(json['source']),
        content = json['content'] ?? '',
        datePublished = json['publishedAt'] ?? '',
        description = json['description'] ?? '',
        titulo = json['title'] ?? '',
        url = json['url'] ?? '',
        urlImage = json['urlToImage'] ?? '';
}

class Source {
  final String? sourceName;
  final String? sourceId;

  Source.fromjson(Map<String, dynamic> source)
      : sourceName = source['name'] ?? '',
        sourceId = source['id'] ?? '';
}
