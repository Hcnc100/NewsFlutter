import 'package:news/models/data/news_data.dart';

abstract class NewsLocalDataSource {
  Stream<List<NewsData>> getNews();

  Future<void> replaceNewsList(List<NewsData> newsList);

  Future<void> deleteAllNews();

  Future<void> insertNewsList(List<NewsData> newsList);
}
