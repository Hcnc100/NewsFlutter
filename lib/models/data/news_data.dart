import 'package:news/constants/news_constants.dart';
import 'package:news/models/api/response/news_list_response.dart';
import 'package:uuid/uuid.dart';

class NewsData {
  final int newsId;
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
      newsId: uuid.hashCode,
      dateTime: newsResponse.publishedAt!.millisecondsSinceEpoch,
      title: newsResponse.title ?? "",
      description: newsResponse.description ?? "[Without Description]",
      imageUrl: newsResponse.urlToImage ?? "",
      url: newsResponse.url ?? NewsConstants.urlInvalidNews,
    );
  }
}
