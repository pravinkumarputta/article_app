import 'package:article_app/bloc/article_bloc.dart';
import 'package:article_app/bloc/article_state.dart';
import 'package:article_app/routers/router.dart';
import 'package:article_app/routers/routes.dart';
import 'package:article_app/view/article_details_page.dart';
import 'package:article_app/widgets/article_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesList extends StatefulWidget {
  @override
  _ArticlesListState createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        switch (state.status) {
          case ArticleStatus.failure:
            return const Center(child: Text('failed to fetch articles'));
          case ArticleStatus.success:
            if (state.articleList.articles.isEmpty) {
              return const Center(child: Text('no articles'));
            }
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: ArticleListItem(
                      articles: state.articleList.articles[index],
                    ),
                    onTap: () {
                      AppRouter.push(context, ArticleDetailsPageRoute, arguments: ArticleDetailsPageArgs(index));
                    },
                  );
                },
                itemCount: state.articleList.articles.length);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
