import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news/ui/screens/simple_news_screen/widgets/concatenate_indicator.dart';
import 'package:news/ui/screens/simple_news_screen/widgets/news_container.dart';
import 'package:news/ui/screens/view_model/news_view_model.dart';

class SimpleNewsScreen extends HookConsumerWidget {
  const SimpleNewsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();

    void scrollListener() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent * 0.75) {
        ref.read(newsViewModelProvider.notifier).concatNewsList();
      }
    }

    useEffect(() {
      controller.addListener(scrollListener);
      return () {
        controller.removeListener(scrollListener);
      };
    }, const []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(newsViewModelProvider.notifier).getListNews();
      });
      return null;
    }, const []);

    ref.listen(
      newsViewModelProvider.select((value) => value.message),
      (previous, next) {
        if (next.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next),
            ),
          );
        }
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple News'),
        ),
        body: Stack(
          children: [
            RefreshIndicator.adaptive(
              onRefresh: ref.read(newsViewModelProvider.notifier).getListNews,
              child: CustomScrollView(
                controller: controller,
                slivers: const [NewsContainer()],
              ),
            ),
            const ConcatenateIndicator(),
          ],
        ));
  }
}
