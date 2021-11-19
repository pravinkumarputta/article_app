import 'dart:convert';

import 'package:article_app/model/article_list.dart';
import 'package:http/http.dart' as http;

class NetworkProvider {
  final http.Client httpClient;

  const NetworkProvider(this.httpClient);

  Future<ArticleList> fetchArticles() async {
    final response = await httpClient.get(Uri.parse('https://newsapi.org/v2/top-headlines?sources=engadget&apiKey=be8c5d2db3fe41e8935d30f6a4a667a0'));
    print(response.body);
    if (response.statusCode == 200) {
      return ArticleList.fromJson(json.decode(response.body));
    }
    throw Exception('error fetching articles');
  }
}
