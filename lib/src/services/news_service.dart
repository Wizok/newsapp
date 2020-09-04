import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;
// import 'dart:developer' as dev;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'b0082515f75441708901c47d442dbddb';

class NewService with ChangeNotifier {


List<Article> headlines = [];

NewService() {
  this.getTopHeadlines();
}

getTopHeadlines() async {
  
  final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=ca';
  final resp = await http.get(url);

  final newsResponse = newsResponseFromJson(resp.body);

  this.headlines.addAll(newsResponse.articles);
  print(headlines[1].author);
  notifyListeners();
  // dev.debugger();
}

}