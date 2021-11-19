import 'package:article_app/model/article.dart';
import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({Key key, @required this.articles}) : super(key: key);

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Image.network(articles.urlToImage),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                articles.title,
                style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
