import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news/ui/screens/simple_news_screen/widgets/news_item.dart';
import 'package:news/ui/screens/view_model/news_view_model.dart';

class NewsContainer extends ConsumerWidget {
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
          return NewsItems(newsData: news);
        },
        childCount: newsList.length,
      ),
    );
  }
}
