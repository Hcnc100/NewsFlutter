import 'package:news/models/data/news_data.dart';

abstract class NewsRepository {
  Stream<List<NewsData>> getNews();
  Future<void> getListNews();
  Future<void> concatNewsList();
}
