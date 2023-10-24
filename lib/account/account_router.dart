import 'package:fluro/fluro.dart';
import 'package:flutter_study/routers/i_router.dart';
import 'page/account_page.dart';

class AccountRouter implements IRouterProvider {
  static String accountPage = '/account';

  @override
  void initRouter(FluroRouter router) {
    router.define(accountPage,
        handler: Handler(handlerFunc: (_, __) => const AccountPage()));
  }
}
