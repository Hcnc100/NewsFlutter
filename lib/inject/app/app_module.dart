import 'package:news/inject/database/database_module.dart';
import 'package:news/inject/news/news_module.dart';

class AppModule {
  Future<void> registerAll() async {
    await DatabaseModule().init();
    NewsModule().init();
  }
}
