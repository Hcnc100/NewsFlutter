import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:news/models/data/news_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends HookConsumerWidget {
  static const route = '/webview-screen';
  static const name = 'WebViewScreen';

  final NewsData newsData;

  const WebViewScreen({super.key, required this.newsData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(
      () => WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(newsData.url)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsData.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
