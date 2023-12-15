import 'package:news/constants/news_constants.dart';
import 'package:news/data/news/remote/news_api_services.dart';
import 'package:news/datasource/news/remote/news_remote_data_source.dart';
import 'package:news/models/data/news_data.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final NewsApiServices _newsApiServices;

  NewsRemoteDataSourceImpl({required NewsApiServices newsApiServices})
      : _newsApiServices = newsApiServices;

  @override
  Future<List<NewsData>> getListNews({required int page}) async {
    final response = await _newsApiServices.getListNews(
      page: page,
      apiKey: NewsConstants.API_KEY,
      pageSize: NewsConstants.PAGE_SIZE,
      country: NewsConstants.COUNTRY,
    );

    return response.articles!
        .map(NewsData.fromNewsResponse)
        .where((element) => element.url != NewsConstants.urlInvalidNews)
        .toList();
  }
}
