import 'package:fluro/fluro.dart';
import 'package:flutter_study/routers/i_router.dart';

import 'page/login_page.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (_, __) => const LoginPage()));
  }
}
