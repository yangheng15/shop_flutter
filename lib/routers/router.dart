import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routes {
  static String root = '/';
  static String detailPage = '/detail';
  static void configRouters(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('error ==> 路由不存在');
      }
    );
    router.define(detailPage, handler: detailsHandler);
  }
}