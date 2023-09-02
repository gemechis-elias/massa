import 'dart:io';

import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/article.dart';
import '../repositories/article_repository.dart';

class CreateArticleUseCase {
  final ArticleRepository repository;

  CreateArticleUseCase(this.repository);

  Future<Either<Failure, Article>> call(CreateArticleParams params) async {
    print("Create article usecase");
    //  return await repository.createArticle(article);

    // write sample Article data

    try {
      final article = await repository.createArticle(
        title: params.title,
        content: params.content,
        subTitle: params.subTitle,
        image: params.image,
        tags: params.tagList,
      );
      return article; // Return success as Right with null value
    } catch (e) {
      return const Left(ServerFailure('Error creating article'));
    }
  }
}

class CreateArticleParams {
  final String title;
  final String content;
  final String subTitle;
  final File image;
  final String tagList;

  CreateArticleParams({
    required this.title,
    required this.content,
    required this.subTitle,
    required this.image,
    required this.tagList,
  });
}
