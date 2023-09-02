import 'dart:io';

import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/article.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getAllArticles();
  Future<Either<Failure, Article>> getSingleArticle(String articleId);
  Future<Either<Failure, List<Article>>> searchArticle(String tag, String key);

  Future<Either<Failure, void>> updateArticle(Article article);
  Future<Either<Failure, Article>> createArticle({
    required String title,
    required String content,
    required String subTitle,
    required File image,
    required String tags,
  });
  Future<Either<Failure, void>> deleteArticle(String articleId);
  Future<Either<Failure, List<String>>> getTags();
}
