import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;

import 'api_exception.dart';

abstract class LentaRssApi{
  static const _baseUrl = 'https://lenta.ru/rss/';
  final _client = http.Client();

  Future<List<RssItem>> getNews();
}

class LentaLastNewsProvider extends LentaRssApi{
  final _lastNews = 'top7';

  @override
  Future<List<RssItem>> getNews() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await _client.get(Uri.parse(LentaRssApi._baseUrl + _lastNews));
      final rssFeed = RssFeed.parse(response.body);
      if(response.statusCode == 200){
        return RssFeed.parse(response.body).items;
      }
      throw const RssNewsException();
    } on http.ClientException {
      throw const RssNewsException('ClientException');
    }
  }
}

class LentaLastNews24Provider extends LentaRssApi{
  final _last24News = 'last24';

  @override
  Future<List<RssItem>> getNews() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final response = await _client.get(Uri.parse(LentaRssApi._baseUrl + _last24News));
      final rssFeed = RssFeed.parse(response.body);
      if(response.statusCode == 200){
        return RssFeed.parse(response.body).items;
      }
      throw const RssNewsException();
    } on http.ClientException {
      throw const RssNewsException('ClientException');
    }
  }
}