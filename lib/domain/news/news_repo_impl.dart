import 'package:news/datasource/news/local/news_local_data_source.dart';
import 'package:news/datasource/news/remote/news_remote_data_source.dart';
import 'package:news/domain/news/news_repository.dart';
import 'package:news/models/data/news_data.dart';

class NewsRepoIimpl implements NewsRepository {
  final NewsLocalDataSource _newsLocalDataSource;
  final NewsRemoteDataSource _newsRemoteDataSource;

  NewsRepoIimpl({
    required NewsLocalDataSource newsLocalDataSource,
    required NewsRemoteDataSource newsRemoteDataSource,
  })  : _newsLocalDataSource = newsLocalDataSource,
        _newsRemoteDataSource = newsRemoteDataSource;

  int _page = 1;

  @override
  Future<int> getListNews() async {
    _page = 1;
    final newsList = await _newsRemoteDataSource.getListNews(page: _page);
    await _newsLocalDataSource.replaceNewsList(newsList);
    _page++;

    return newsList.length;
  }

  @override
  Stream<List<NewsData>> getNews() => _newsLocalDataSource.getNews();

  @override
  Future<int> concatNewsList() async {
    final newsList = await _newsRemoteDataSource.getListNews(page: _page);
    _newsLocalDataSource.insertNewsList(newsList);
    _page++;

    return newsList.length;
  }
}
