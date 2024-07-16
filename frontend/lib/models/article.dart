class Article {
  String id;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['_id'] as String,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
    );
  }

  static List<Article> fromList(List<dynamic> list) {
    return list
        .map((json) => Article.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
