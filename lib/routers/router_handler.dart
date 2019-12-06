import 'package:flutter/cupertino.dart';
import 'package:fluro/fluro.dart';
import '../page/details_page.dart';

var detailsHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DetailsPage(params['id'].first);
});