import 'package:article_app/model/article_list.dart';
import 'package:equatable/equatable.dart';

enum ArticleStatus { initial, success, failure }

class ArticleState extends Equatable {
  const ArticleState({this.status, this.articleList});

  final ArticleList articleList;
  final ArticleStatus status;

  ArticleState copyWith({
    ArticleStatus status,
    ArticleList articleList
  }) {
    return ArticleState(
      status: status ?? this.status,
      articleList: articleList ?? this.articleList,
    );
  }

  @override
  String toString() {
    return '''ArticleState { articleList: ${articleList.articles.length} }''';
  }

  @override
  List<Object> get props => [articleList];
}
