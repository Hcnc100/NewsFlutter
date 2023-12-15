import 'package:news/data/news/local/news_dao.dart';
import 'package:news/datasource/news/local/news_local_data_source.dart';
import 'package:news/models/data/news_data.dart';
import 'package:news/models/entity/news_entity.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final NewsDAO _newsDAO;

  NewsLocalDataSourceImpl({
    required NewsDAO newsDAO,
  }) : _newsDAO = newsDAO;

  @override
  Future<void> deleteAllNews() => _newsDAO.deleteAllNews();

  @override
  Stream<List<NewsData>> getNews() => _newsDAO
      .getNews()
      .map((newsList) => newsList.map(NewsData.fromNewsEntity).toList());

  @override
  Future<void> insertNewsList(List<NewsData> newsList) =>
      _newsDAO.insertNewsList(newsList.map(NewsEntity.fromNewsData).toList());

  @override
  Future<void> replaceNewsList(List<NewsData> newsList) =>
      _newsDAO.replaceNewsList(newsList.map(NewsEntity.fromNewsData).toList());
}
