import 'dart:convert';

import 'package:flutter_application_1/models/news_article.dart';
import 'package:http/http.dart' as http;


String API_KEY = "994a4c99a79aafa83bf9b4362a52b870";
String MAIN_URL = "http://api.mediastack.com/v1";

Future<List<NewsArticle>> getNews({
  List<String>? categories,
  String? source,
  String? sort,
  String? language,
  String? country,
  int? limit,
  int? offset,
}) async {
  final queryParams = <String, dynamic>{};

    queryParams['access_key'] = API_KEY;
  if (categories != null) {
    queryParams['categories'] = categories.join(',');
  }
  if (source != null) {
    queryParams['source'] = source;
  }
  if (sort != null) {
    queryParams['sort'] = sort;
  }
  if (language != null) {
    queryParams['language'] = language;
  }
  if (country != null) {
    queryParams['country'] = country;
  }
  if (limit != null) {
    queryParams['limit'] = limit;
  }
  if (offset != null) {
    queryParams['offset'] = offset;
  }

  var res = queryParams.entries.map((e)=> '${e.key}=${e.value}').toList().join('&');

  final url = Uri.parse('$MAIN_URL/news?$res');

  final response = await http.get(url);

  final json = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return List<NewsArticle>.from(List<dynamic>.from(json['data']).map((e) => NewsArticle.fromJson(e)));
  } else {
    throw Exception('Error: data not returned, ${response.body}');
  }
}

Future<List<NewsArticle>> getNewsSources(String searchKeyword, {List<String>? countries, List<String>? languages, List<String>? categories, int? limit, int? offset}) async {
  // Create the base URL with the API key and search query
  var baseUrl = '$MAIN_URL/sources?access_key=$API_KEY&search=$searchKeyword';
  
  // Add optional parameters to the URL if provided
  if (countries != null && countries.isNotEmpty) {
    baseUrl += '&countries=${countries.join(',')}';
  }
  if (languages != null && languages.isNotEmpty) {
    baseUrl += '&languages=${languages.join(',')}';
  }
  if (categories != null && categories.isNotEmpty) {
    baseUrl += '&categories=${categories.join(',')}';
  }
  if (limit != null) {
    baseUrl += '&limit=$limit';
  }
  if (offset != null) {
    baseUrl += '&offset=$offset';
  }
  
  // Make the HTTP request and decode the response JSON
  final response = await http.get(Uri.parse(baseUrl));
  final json = jsonDecode(response.body);
  
  // Check the response status code and return the list of news articles or throw an exception
  if (response.statusCode == 200) {
    return List<NewsArticle>.from(List<dynamic>.from(json['data']).map((e) => NewsArticle.fromJson(e)));
  } else {
    throw Exception('Error: data not returned, ${response.body}');
  }
}
