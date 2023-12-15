import 'package:go_router/go_router.dart';
import 'package:news/models/data/news_data.dart';
import 'package:news/ui/screens/simple_news_screen/simple_news_screen.dart';
import 'package:news/ui/screens/webview_screen/webview_screen.dart';

abstract class NewsNavigator {
  static final newsRouter = GoRouter(
    initialLocation: SimpleNewsScreen.route,
    routes: [
      GoRoute(
        path: SimpleNewsScreen.route,
        name: SimpleNewsScreen.name,
        builder: (context, state) => const SimpleNewsScreen(),
      ),
      GoRoute(
        path: WebViewScreen.route,
        name: WebViewScreen.name,
        builder: (context, state) {
          final newsData = state.extra as NewsData;
          return WebViewScreen(newsData: newsData);
        },
      ),
    ],
  );
}
