import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_study/home/home_provider.dart';
import 'package:flutter_study/account/page/account_page.dart';
import 'package:flutter_study/goods/page/goods_page.dart';
import 'package:flutter_study/order/page/order_page.dart';
import 'package:flutter_study/statistics/page/statistics_page.dart';
import 'package:flutter_study/widgets/load-image.dart';
import 'package:flutter_study/basicConstant/colors.dart';

// 定义Home类，继承自StatefulWidget
class Home extends StatefulWidget {
  const Home({super.key});
  // 初始化状态
  @override
  _HomeState createState() => _HomeState();
}

// 定义_HomeState类，继承自State，并实现RestorationMixin接口
class _HomeState extends State<Home> with RestorationMixin {
  // 定义_imageSize变量，用于设置图片大小
  static const double _imageSize = 25.0;
  // 定义_pageList变量，用于存储页面列表
  late List<Widget> _pageList;
  // 定义_appBarTitles变量，用于存储应用标题
  final List<String> _appBarTitles = ['订单', '商品', '统计', '店铺'];
  // 定义_pageController变量，用于存储页面控制器
  final PageController _pageController = PageController();
  // 定义provider变量，用于存储HomeProvider
  HomeProvider provider = HomeProvider();
  // 定义_list变量，用于存储底部导航栏项目
  List<BottomNavigationBarItem>? _list;
  // 初始化状态
  @override
  void initState() {
    super.initState();
    initData();
  }

  // 初始化数据
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 初始化数据
  void initData() {
    _pageList = const [OrderPage(),GoodsPage(),StatisticsPage(),AccountPage()];
  }
  

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const tabImages = [
        [
          LoadAssetImage(
            'home/icon_order',
            width: _imageSize,
            color: Colours.unselected_item_color,
          ),
          LoadAssetImage(
            'home/icon_order',
            width: _imageSize,
            color: Colours.app_main,
          ),
        ],
        [
          LoadAssetImage(
            'home/icon_commodity',
            width: _imageSize,
            color: Colours.unselected_item_color,
          ),
          LoadAssetImage(
            'home/icon_commodity',
            width: _imageSize,
            color: Colours.app_main,
          ),
        ],
        [
          LoadAssetImage(
            'home/icon_statistics',
            width: _imageSize,
            color: Colours.unselected_item_color,
          ),
          LoadAssetImage(
            'home/icon_statistics',
            width: _imageSize,
            color: Colours.app_main,
          ),
        ],
        [
          LoadAssetImage(
            'home/icon_shop',
            width: _imageSize,
            color: Colours.unselected_item_color,
          ),
          LoadAssetImage(
            'home/icon_shop',
            width: _imageSize,
            color: Colours.app_main,
          ),
        ]
      ];
      _list = List.generate(tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: tabImages[i][0],
          activeIcon: tabImages[i][1],
          label: _appBarTitles[i],
          tooltip: _appBarTitles[i],
        );
      });
    }
    return _list!;
  }

  // 构建底部导航栏项目
  // int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => provider,
      child: Scaffold(
        bottomNavigationBar: Consumer<HomeProvider>(
          builder: (_, provider, __) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: provider.value,
              elevation: 5.0,
              iconSize: 21.0,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              selectedItemColor: const Color.fromARGB(255, 2, 88, 128),
              unselectedItemColor: Colours.unselected_item_color,

              items:_buildBottomNavigationBarItem(),
              //  const <BottomNavigationBarItem>[
              //   BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
              //   BottomNavigationBarItem(label: 'book', icon: Icon(Icons.book)),
              // ],
              onTap: (index) => _pageController.jumpToPage(index),
              // onTap: onTabChange,
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (int index) => provider.value = index,
          children: _pageList,
        ),
      ),
    );
  }

  // void onTabChange(int value) {
  //   print(provider.value);
  //   _pageController.jumpToPage(value);
  //   setState(() {});
  // }
  // 重建状态
  @override
  String? get restorationId => 'home';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
