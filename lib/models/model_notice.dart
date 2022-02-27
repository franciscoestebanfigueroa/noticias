class ModelNotice {
  final String? sourceName;
  final String? sourceId;
  final String titulo;
  final String? description;
  final String? url;
  final String? urlImage;
  final String? datePublished;
  final String? content;

  ModelNotice(this.sourceName, this.sourceId, this.titulo, this.description,
      this.url, this.urlImage, this.datePublished, this.content);

  ModelNotice.fromJson(Map<String, dynamic> json)
      : sourceName = json['source']['id'] ?? '1',
        sourceId = json['source']['name'] ?? '2',
        titulo = json['title'],
        description = json['description'] ?? '3',
        url = json['url'] ?? '4',
        urlImage = json['urlToImage'] ?? '',
        datePublished = json['publishedAt'] ?? '6',
        content = json['content'] ?? '7';
}
