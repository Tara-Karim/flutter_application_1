class NewsSource {
  final String? id;
  final String? name;
  final String? category;
  final String? country;
  final String? language;
  final String? url;

  NewsSource({
    required this.id,
    required this.name,
    required this.category,
    required this.country,
    required this.language,
    required this.url,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      country: json['country'],
      language: json['language'],
      url: json['url'],
    );
  }
}
