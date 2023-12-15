import 'package:dio/dio.dart';
import 'package:news/constants/news_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:news/models/api/response/news_list_response.dart';

part 'news_api_services.g.dart';

@RestApi(baseUrl: NewsConstants.BASE_URL)
abstract class NewsApiServices {
  factory NewsApiServices(Dio dio) = _NewsApiServices;

  @GET("top-headlines")
  Future<NewsListResponse> getListNews({
    @Query("page") required int page,
    @Query("apiKey") required String apiKey,
    @Query("pageSize") required int pageSize,
    @Query("country") required String country,
  });
}
