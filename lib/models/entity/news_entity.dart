import 'package:floor/floor.dart';
import 'package:news/models/data/news_data.dart';

@Entity(tableName: "news")
class NewsEntity {
  @primaryKey
  final String newsId;
  final int dateTime;
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  NewsEntity({
    required this.newsId,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory NewsEntity.fromNewsData(NewsData newsData) {
    return NewsEntity(
      newsId: newsData.newsId,
      dateTime: newsData.dateTime,
      title: newsData.title,
      description: newsData.description,
      imageUrl: newsData.imageUrl,
      url: newsData.url,
    );
  }
}
