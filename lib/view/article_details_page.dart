import 'package:article_app/bloc/article_bloc.dart';
import 'package:article_app/bloc/article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleDetailsPageArgs {
  int articleIndex;

  ArticleDetailsPageArgs(this.articleIndex);
}

class ArticleDetailsPage extends StatefulWidget {
  final ArticleDetailsPageArgs _articleDetailsPageArgs;

  const ArticleDetailsPage(this._articleDetailsPageArgs);

  @override
  createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        var articleDetails = state.articleList.articles[widget._articleDetailsPageArgs.articleIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(articleDetails.source.name),
            backgroundColor: Color(0xFF313438),
            brightness: Brightness.dark,
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Scrollbar(
              child: Column(
                children: [
                  Text(
                    articleDetails.title,
                    style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(articleDetails.description),
                  SizedBox(
                    height: 15,
                  ),
                  Image.network(articleDetails.urlToImage),
                  SizedBox(
                    height: 15,
                  ),
                  Text(articleDetails.content),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
