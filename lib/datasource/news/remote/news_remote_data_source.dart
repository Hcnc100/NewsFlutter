import 'package:news/models/data/news_data.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsData>> getListNews({required int page});
}
