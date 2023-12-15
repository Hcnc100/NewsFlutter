import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injector/injector.dart';
import 'package:news/domain/news/news_repository.dart';
import 'package:news/models/data/news_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_view_model.freezed.dart';
part 'news_view_model.g.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLoading,
    @Default(null) List<NewsData>? listNews,
    @Default(false) bool isConcated,
    @Default(false) bool enableLoadMore,
    @Default("") String message,
  }) = _NewsState;
}

@riverpod
class NewsViewModel extends _$NewsViewModel {
  final NewsRepository _newsRepository = Injector.appInstance.get();

  @override
  NewsState build() {
    final listener = _newsRepository.getNews().listen((event) {
      state = state.copyWith(listNews: event);
    });

    ref.onDispose(listener.cancel);

    return const NewsState();
  }

  Future<void> getListNews() async {
    state = state.copyWith(
      isLoading: true,
      message: "",
    );
    try {
      final numberNews = await _newsRepository.getListNews();
      state = state.copyWith(
        enableLoadMore: numberNews != 0,
      );
    } catch (e) {
      state = state.copyWith(
        message: e.toString(),
      );
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> concatNewsList() async {
    if (state.isConcated) return;
    if (!state.enableLoadMore) return;
    if (state.isLoading) return;

    state = state.copyWith(
      isConcated: true,
    );
    try {
      final numberNews = await _newsRepository.concatNewsList();
      state = state.copyWith(
        enableLoadMore: numberNews != 0,
      );
    } catch (e) {
      state = state.copyWith(
        message: e.toString(),
      );
    }
    state = state.copyWith(
      isConcated: false,
    );
  }
}
