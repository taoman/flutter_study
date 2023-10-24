import 'package:fluro/fluro.dart';
import 'package:flutter_study/routers/i_router.dart';
import 'page/goods_page.dart';

class GoodsRouter implements IRouterProvider {
  static String accountPage = '/goods';

  @override
  void initRouter(FluroRouter router) {
    router.define(accountPage,
        handler: Handler(handlerFunc: (_, __) => const GoodsPage()));
  }
}
