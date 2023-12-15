import 'package:injector/injector.dart';
import 'package:news/database/news_database.dart';

class DatabaseModule {
  final Injector _injector = Injector.appInstance;

  Future<void> _provideNewsDatabase() async {
    final NewsDatabase database =
        await $FloorNewsDatabase.databaseBuilder('news.db').build();
    _injector.registerSingleton<NewsDatabase>(() => database);
  }

  Future<void> init() async {
    await _provideNewsDatabase();
  }
}
