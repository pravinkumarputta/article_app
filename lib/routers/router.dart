import 'package:article_app/routers/routes.dart';
import 'package:article_app/view/article_details_page.dart';
import 'package:article_app/view/articles_page.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static initRoutes() {
    return <String, WidgetBuilder>{
      ArticlesPageRoute: (BuildContext context) => ArticlesPage(),
      ArticleDetailsPageRoute: (BuildContext context) => ArticleDetailsPage(ModalRoute.of(context).settings.arguments),
    };
  }

  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }

  static Future<Object> push(BuildContext context, String routeName, {Object arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static Future<Object> replace(BuildContext context, String routeName, {Object arguments}) {
    return Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static pop<T extends Object>(BuildContext context, [T result]) {
    Navigator.of(context).pop(result);
  }

  static popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil(ModalRoute.withName(routeName));
  }

  static Future<Object> pushAndClearBackStack(BuildContext context, String routeName) {
    return Navigator.of(context).pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }
}
