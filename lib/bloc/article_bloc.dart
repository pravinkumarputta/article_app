import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:article_app/bloc/article_event.dart';
import 'package:article_app/bloc/article_state.dart';
import 'package:article_app/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc(this.repository) : super(const ArticleState());

  final Repository repository;

  @override
  Stream<Transition<ArticleEvent, ArticleState>> transformEvents(
      Stream<ArticleEvent> events,
      TransitionFunction<ArticleEvent, ArticleState> transitionFn,
      ) {
    return super.transformEvents(
      events.throttleTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is ArticleFetched) {
      yield await _mapArticleFetchedToState(state);
    }
  }

  Future<ArticleState> _mapArticleFetchedToState(ArticleState state) async {
    try {
      final articles = await repository.fetchArticles();
      return state.copyWith(
        status: ArticleStatus.success,
        articleList: articles,
      );
    } on Exception {
      return state.copyWith(status: ArticleStatus.failure);
    }
  }
}