import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'news_list_response.freezed.dart';
part 'news_list_response.g.dart';

@freezed
class NewsListResponse with _$NewsListResponse {
  const factory NewsListResponse({
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "totalResults") int? totalResults,
    @JsonKey(name: "articles") List<NewsResponse>? articles,
  }) = _NewsListResponse;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);
}

@freezed
class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    @JsonKey(name: "source") Source? source,
    @JsonKey(name: "author") String? author,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "urlToImage") String? urlToImage,
    @JsonKey(name: "publishedAt") DateTime? publishedAt,
    @JsonKey(name: "content") String? content,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
