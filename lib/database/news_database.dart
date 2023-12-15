import 'dart:async';
import 'package:floor/floor.dart';
import 'package:news/data/news/local/news_dao.dart';
import 'package:news/models/entity/news_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'news_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [NewsEntity])
abstract class NewsDatabase extends FloorDatabase {
  NewsDAO get newsDAO;
}
