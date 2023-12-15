import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news/ui/screens/simple_news_screen/view_model/news_view_model.dart';
import 'package:news/ui/screens/simple_news_screen/widgets/news_item.dart';
import 'package:news/ui/screens/webview_screen/webview_screen.dart';

class NewsContainer extends ConsumerWidget {
  static const route = '/simple-news-screen';
  static const name = 'SimpleNewsScreen';
  const NewsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (isLoading, newsList) = ref.watch(
      newsViewModelProvider
          .select((value) => (value.isLoading, value.listNews)),
    );

    if (isLoading && newsList == null) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (newsList == null || newsList.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: Text("No Data"),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final news = newsList[index];
          return NewsItems(
            newsData: news,
            onTap: () {
              context.push(WebViewScreen.route, extra: news);
            },
          );
        },
        childCount: newsList.length,
      ),
    );
  }
}
