import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:dartz/dartz.dart';

abstract class BlogRemoteDataSource {
  Future<List<Article>> getAllBlog();
  Future<Map<String, dynamic>> postBlog(Map<String, dynamic> blogData);
  Future<void> deleteBlog(String articleId);
  Future<List<Article>> searchArticle(String tag, String key);
  // get tags
  Future<List<String>> getTags();
}

abstract class BlogLocalDataSource {
  Future<Either<Failure, List<Article>>> getAllArticles();
  Future<Either<Failure, void>> createArticle(Article article);
  Future<Either<Failure, void>> deleteArticle(String articleId);
  Future<List<Article>> searchArticle(String tag, String key);
  Future<Either<Failure, Article>> getAllArticle(String tags);
  Future<Either<Failure, Article>> getSingleArticle(String articleId);
  Future<List<String>> getTags();
}
