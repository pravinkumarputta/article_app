import 'package:article_app/model/article.dart';
import 'package:equatable/equatable.dart';

class ArticleList extends Equatable {
  String status;
  int totalResults;
  List<Articles> articles;

  ArticleList({this.status, this.totalResults, this.articles});

  ArticleList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [status, totalResults, articles];
}