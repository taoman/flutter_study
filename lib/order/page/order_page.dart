
import 'package:flutter/material.dart';
import 'package:flutter_study/util/image_utils.dart';
import 'package:flutter_study/order/provider/order_page_provider.dart';
import 'package:provider/provider.dart';
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with
        AutomaticKeepAliveClientMixin<OrderPage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  TabController? _tabController;
  OrderPageProvider provider = OrderPageProvider();

  int LlastReportedPage = 0;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  void _preCacheImage() {
    precacheImage(ImageUtils.getAssetImage('order/xdd_n'), context);
    precacheImage(ImageUtils.getAssetImage('order/dps_s'), context);
    precacheImage(ImageUtils.getAssetImage('order/dwc_s'), context);
    precacheImage(ImageUtils.getAssetImage('order/ywc_s'), context);
    precacheImage(ImageUtils.getAssetImage('order/yqx_s'), context);
  }

  bool isDark = false;
  @override
  Widget build(BuildContext context){
    super.build(context);
    // isDark = context.isDark;
    return ChangeNotifierProvider<OrderPageProvider>(create: (_) => provider,
    child: Scaffold(
      body:Stack(
        children: <Widget>[
          SafeArea(child: SizedBox(
            height: 105,
            width: double.infinity,
          ),)
        ],
      ),
    ),
    );
  }

}
