import 'package:fluro/fluro.dart';
import 'package:flutter_study/routers/i_router.dart';
import 'page/statistics_page.dart';

class StatisticsRouter implements IRouterProvider {
  static String accountPage = '/statistics';

  @override
  void initRouter(FluroRouter router) {
    router.define(accountPage,
        handler: Handler(handlerFunc: (_, __) => const StatisticsPage()));
  }
}
