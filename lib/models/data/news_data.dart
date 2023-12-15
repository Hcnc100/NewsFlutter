import 'package:news/constants/news_constants.dart';
import 'package:news/models/api/response/news_list_response.dart';
import 'package:news/models/entity/news_entity.dart';
import 'package:uuid/uuid.dart';

class NewsData {
  final String newsId;
  final int dateTime;
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  NewsData({
    required this.newsId,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory NewsData.fromNewsResponse(
    NewsResponse newsResponse,
  ) {
    final uuid =
        const Uuid().v5(Uuid.NAMESPACE_URL, newsResponse.url!).toString();

    return NewsData(
      newsId: uuid,
      dateTime: newsResponse.publishedAt!.millisecondsSinceEpoch,
      title: newsResponse.title ?? "",
      description: newsResponse.description ?? "[Without Description]",
      imageUrl: newsResponse.urlToImage ?? "",
      url: newsResponse.url ?? NewsConstants.urlInvalidNews,
    );
  }

  factory NewsData.fromNewsEntity(NewsEntity news) {
    return NewsData(
      newsId: news.newsId,
      dateTime: news.dateTime,
      title: news.title,
      description: news.description,
      imageUrl: news.imageUrl,
      url: news.url,
    );
  }
}
