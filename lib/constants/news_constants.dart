import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class NewsConstants {
  static const String baseUrl = "https://newsapi.org/v2/";
  static const String country = "us";
  static const int pageSize = 10;
  static const String urlInvalidNews = "https://removed.com";

  static String getNewsKey() => dotenv.env['NEWS_KEY']!;
}
