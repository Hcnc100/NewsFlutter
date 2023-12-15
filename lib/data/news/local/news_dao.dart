import 'package:floor/floor.dart';
import 'package:news/models/entity/news_entity.dart';

@dao
abstract class NewsDAO {
  @Query("SELECT * FROM news")
  Stream<List<NewsEntity>> getNews();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNewsList(List<NewsEntity> newsList);

  @Query("DELETE FROM news")
  Future<void> deleteAllNews();

  @transaction
  Future<void> replaceNewsList(List<NewsEntity> newsList) async {
    await deleteAllNews();
    await insertNewsList(newsList);
  }
}
