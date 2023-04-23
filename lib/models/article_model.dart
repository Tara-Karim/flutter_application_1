import 'package:equatable/equatable.dart';

class Article extends Equatable{
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.createdAt,
    required this.views
});

static List<Article> articles = [
  Article(id: '1', title: 'lorem ipsum dolor sit', subtitle: 'lorem ipsum', body: 'lorem ipsum dolor sit sit dolor',
   author: 'tara xatwn', authorImageUrl: 'https://www.pexels.com/@james-frid-81279/', category: 'politics', imageUrl: 'https://images.pexels.com/photos/1478419/pexels-photo-1478419.jpeg?auto=compress&cs=tinysrgb&w=600', 
   createdAt: DateTime.now().subtract(const Duration(hours: 5)), views: 1204),

     Article(id: '1', title: 'lorem ipsum dolor sit', subtitle: 'lorem ipsum', body: 'lorem ipsum dolor sit sit dolor',
   author: 'tara xatwn', authorImageUrl: 'https://www.pexels.com/@james-frid-81279/', category: 'politics', imageUrl: 'https://images.pexels.com/photos/1478419/pexels-photo-1478419.jpeg?auto=compress&cs=tinysrgb&w=600', 
   createdAt: DateTime.now().subtract(const Duration(hours: 5)), views: 1204),

     Article(id: '1', title: 'lorem ipsum dolor sit', subtitle: 'lorem ipsum', body: 'lorem ipsum dolor sit sit dolor',
   author: 'tara xatwn', authorImageUrl: 'https://www.pexels.com/@james-frid-81279/', category: 'politics', imageUrl: 'https://images.pexels.com/photos/1478419/pexels-photo-1478419.jpeg?auto=compress&cs=tinysrgb&w=600', 
   createdAt: DateTime.now().subtract(const Duration(hours: 5)), views: 1204),
   
     Article(id: '1', title: 'lorem ipsum dolor sit', subtitle: 'lorem ipsum', body: 'lorem ipsum dolor sit sit dolor',
   author: 'tara xatwn', authorImageUrl: 'https://www.pexels.com/@james-frid-81279/', category: 'politics', imageUrl: 'https://images.pexels.com/photos/1478419/pexels-photo-1478419.jpeg?auto=compress&cs=tinysrgb&w=600', 
   createdAt: DateTime.now().subtract(const Duration(hours: 5)), views: 1204)
];

  @override 
  List<Object> get props => [
    id,
    title,
    subtitle,
    body,
    author,
    authorImageUrl,
    category,
    imageUrl,
    createdAt,
  ];
}