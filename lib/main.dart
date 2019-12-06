import 'package:flutter/material.dart';
import 'package:flutter_shop/page/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import 'package:fluro/fluro.dart';
import 'routers/appliction.dart';
import 'routers/router.dart';

void main() {
  final providers = Providers()
    ..provide(Provider.function((context) => Counter()));

  runApp(
      ProviderNode(
        providers: providers,
        child: MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configRouters(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: '百姓生活家',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false, // 去掉debug
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: IndexPage(),
      ),
    );
  }
}
