import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news/ui/screens/view_model/news_view_model.dart';

class ConcatenateIndicator extends ConsumerWidget {
  const ConcatenateIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isConcated =
        ref.watch(newsViewModelProvider.select((value) => value.isConcated));

    return Visibility(
        visible: isConcated,
        child: const Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Card(
              elevation: 10,
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ));
  }
}
