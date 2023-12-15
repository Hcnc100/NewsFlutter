// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorNewsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NewsDatabaseBuilder databaseBuilder(String name) =>
      _$NewsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$NewsDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$NewsDatabaseBuilder(null);
}

class _$NewsDatabaseBuilder {
  _$NewsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$NewsDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$NewsDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<NewsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$NewsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$NewsDatabase extends NewsDatabase {
  _$NewsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NewsDAO? _newsDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `news` (`newsId` TEXT NOT NULL, `dateTime` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `imageUrl` TEXT NOT NULL, `url` TEXT NOT NULL, PRIMARY KEY (`newsId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NewsDAO get newsDAO {
    return _newsDAOInstance ??= _$NewsDAO(database, changeListener);
  }
}

class _$NewsDAO extends NewsDAO {
  _$NewsDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _newsEntityInsertionAdapter = InsertionAdapter(
            database,
            'news',
            (NewsEntity item) => <String, Object?>{
                  'newsId': item.newsId,
                  'dateTime': item.dateTime,
                  'title': item.title,
                  'description': item.description,
                  'imageUrl': item.imageUrl,
                  'url': item.url
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NewsEntity> _newsEntityInsertionAdapter;

  @override
  Stream<List<NewsEntity>> getNews() {
    return _queryAdapter.queryListStream('SELECT * FROM news',
        mapper: (Map<String, Object?> row) => NewsEntity(
            newsId: row['newsId'] as String,
            dateTime: row['dateTime'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            imageUrl: row['imageUrl'] as String,
            url: row['url'] as String),
        queryableName: 'news',
        isView: false);
  }

  @override
  Future<void> deleteAllNews() async {
    await _queryAdapter.queryNoReturn('DELETE FROM news');
  }

  @override
  Future<void> insertNewsList(List<NewsEntity> newsList) async {
    await _newsEntityInsertionAdapter.insertList(
        newsList, OnConflictStrategy.replace);
  }

  @override
  Future<void> replaceNewsList(List<NewsEntity> newsList) async {
    if (database is sqflite.Transaction) {
      await super.replaceNewsList(newsList);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$NewsDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.newsDAO.replaceNewsList(newsList);
      });
    }
  }
}
