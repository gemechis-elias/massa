import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:smart_gebere/core/error/failure.dart';
import 'package:smart_gebere/features/blog/data/datasources/data_source_api.dart';
import 'package:smart_gebere/features/blog/data/models/blog_model.dart';
import 'package:smart_gebere/features/blog/domain/entities/article.dart';
import 'package:smart_gebere/features/blog/domain/repositories/article_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final BlogRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Article>>> getAllArticles() async {
    try {
      final articles = await remoteDataSource.getAllBlog();

      return Right(articles);
    } catch (e) {
      log("Error fetching articles-: $e");
      return const Left(ServerFailure('Error fetching articles'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getTags() async {
    try {
      final tags = await remoteDataSource.getTags();
      return Right(tags);
    } catch (e) {
      log("Error fetching tags: $e");
      return const Left(ServerFailure('Error fetching tags'));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> searchArticle(
      String tag, String key) async {
    try {
      final articles = await remoteDataSource.searchArticle(tag, key);
      return Right(articles);
    } catch (e) {
      log("Error searching articles: $e");
      return const Left(ServerFailure('Error searching articles'));
    }
  }

  @override
  Future<Either<Failure, Article>> createArticle({
    required String title,
    required String content,
    required String subTitle,
    required File image,
    required String tags,
  }) async {
    try {
      log("Converting image to multipart");

      final articleData = {
        'title': title,
        'content': content,
        'subTitle': subTitle,
        'image': image,
        'tags': tags,
      };
      log('Creating article From Repo imp');
      final responseData = await remoteDataSource.postBlog(articleData);
      log('Create article repo = received');

      if (responseData != null) {
        final article = Article.fromJson(responseData);
        // Save user data to local storage
        // await localDataSource.saveUserData(user);
        log('Article created $article');
        return Right(article);
      } else {
        log("Invalid response data format: $responseData");
        return const Left(ServerFailure('Invalid response data format'));
      }
    } catch (e) {
      return const Left(ServerFailure('Error registering user'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteArticle(String articleId) {
    // TODO: implement deleteArticle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Article>> getAllArticle(String tags) {
    // TODO: implement getAllArticle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Article>> getSingleArticle(String articleId) {
    // TODO: implement getSingleArticle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateArticle(Article article) {
    // TODO: implement updateArticle
    throw UnimplementedError();
  }
}
