import 'package:article_app/bloc/article_bloc.dart';
import 'package:article_app/bloc/article_event.dart';
import 'package:article_app/data/network_provider.dart';
import 'package:article_app/data/repository.dart';
import 'package:article_app/routers/router.dart';
import 'package:article_app/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticleBloc(Repository(NetworkProvider(http.Client())))..add(ArticleFetched()),
      child: MaterialApp(
        initialRoute: ArticlesPageRoute,
        routes: AppRouter.initRoutes(),
      ),
    );
  }
}
