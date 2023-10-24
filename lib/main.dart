import 'package:flutter/material.dart';
import 'package:flutter_study/routers/routers.dart';
import 'package:flutter_study/login/page/login_page.dart';
import './routers/routers.dart';
import 'package:flutter_study/home/home_page.dart';
void main() {
  Routes.initRoutes();
  runApp(const MyApp());
}

const img1 =
    "https://ducafecat.tech/2021/12/09/blog/2021-jetbrains-fleet-vs-vscode/2021-12-09-10-30-00.png";
const img2 =
    "https://ducafecat.tech/2021/12/09/blog/2021-jetbrains-fleet-vs-vscode/2021-12-09-20-45-02.png";

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);
  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  String? imgUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                imgUrl = imgUrl == img1 ? img2 : img1;
              });
            },
            child: const Text("切换图片")),
        ImageWidget(imgUrl: imgUrl ?? img1),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.amber,
      child: Image.network(imgUrl),
    );
  }
}

Widget imageWidget({required String imgUrl}) {
  return Container(
    padding: const EdgeInsets.all(10),
    color: Colors.amber,
    child: Image.network(imgUrl),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: const LoginPage(),
      home: const Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  Routes.router.navigateTo(context, '/login');
                },
                child: const Text('去登录')),
            const BannerWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
