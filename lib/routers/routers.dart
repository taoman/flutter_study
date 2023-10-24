import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/routers/i_router.dart';
import 'package:flutter_study/login/login_router.dart';
import 'package:flutter_study/account/account_router.dart';
import 'package:flutter_study/goods/goods_router.dart';
import 'package:flutter_study/order/order_router.dart';
import 'package:flutter_study/statistics/statistics_router.dart';

class Routes {
  static final List<IRouterProvider> _listRouter = [];
  static final FluroRouter router = FluroRouter();
  static void initRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('not found');
      return;
    });
    _listRouter.clear();
    _listRouter.add(LoginRouter());
    _listRouter.add(AccountRouter());
    _listRouter.add(GoodsRouter());
    _listRouter.add(OrderRouter());
    _listRouter.add(StatisticsRouter());
    
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
