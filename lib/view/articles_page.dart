import 'package:article_app/view/articles_list.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        backgroundColor: Color(0xFF313438),
        brightness: Brightness.dark,
      ),
      body: ArticlesList(),
    );
  }
}
