import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/inject/app/app_module.dart';
import 'package:news/navigation/news_navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppModule().registerAll();

  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "News App",
      routerConfig: NewsNavigator.newsRouter,
    );
  }
}
