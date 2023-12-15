import 'package:dio/dio.dart';
import 'package:injector/injector.dart';
import 'package:news/data/news/local/news_dao.dart';
import 'package:news/data/news/remote/news_api_services.dart';
import 'package:news/database/news_database.dart';
import 'package:news/datasource/news/local/news_local_data_source.dart';
import 'package:news/datasource/news/local/news_local_data_source_impl.dart';
import 'package:news/datasource/news/remote/news_remote_data_source.dart';
import 'package:news/datasource/news/remote/news_remote_data_source_impl.dart';
import 'package:news/domain/news/news_repo_impl.dart';
import 'package:news/domain/news/news_repository.dart';

class NewsModule {
  final _injector = Injector.appInstance;

  void _provideNewsDAO() {
    final NewsDatabase database = _injector.get();
    _injector.registerSingleton<NewsDAO>(() => database.newsDAO);
  }

  void _provideNewsApiServices() {
    _injector.registerSingleton<NewsApiServices>(
      () => NewsApiServices(Dio()),
    );
  }

  void _provideNewsLocalDataSource() {
    _injector.registerSingleton<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(newsDAO: _injector.get()),
    );
  }

  void _provideNewsRemoteDataSource() {
    _injector.registerSingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(
        newsApiServices: _injector.get(),
      ),
    );
  }

  void _provideNewsRepository() {
    _injector.registerSingleton<NewsRepository>(
      () => NewsRepoIimpl(
        newsLocalDataSource: _injector.get(),
        newsRemoteDataSource: _injector.get(),
      ),
    );
  }

  void init() {
    _provideNewsDAO();
    _provideNewsApiServices();
    _provideNewsLocalDataSource();
    _provideNewsRemoteDataSource();
    _provideNewsRepository();
  }
}
