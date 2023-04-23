class NewsArticle {
 final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? source;
  final String? image;
  final String? category;
  final String? language;
  final String? country;
  final DateTime? publishedAt;

  NewsArticle({
    this.author,
    this.title,
    this.description,
    this.url,
    this.source,
    this.image,
    this.category,
    this.language,
    this.country,
    this.publishedAt,
  });


  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      source: json['source'],
      image: json['image'],
      category: json['category'],
      language: json['language'],
      country: json['country'],
      publishedAt: DateTime.parse(json['published_at']),
    );
  }
}
