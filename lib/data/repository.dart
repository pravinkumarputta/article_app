
import 'package:article_app/model/article_list.dart';

import 'network_provider.dart';

class Repository {
  final NetworkProvider networkProvider;

  Repository(this.networkProvider);

  Future<ArticleList> fetchArticles() async {
    return await networkProvider.fetchArticles();
  }
}
