import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/article.dart';
import '../repositories/article_repository.dart';

class GetSingleArticleUseCase {
  final ArticleRepository repository;

  GetSingleArticleUseCase(this.repository);

  Future<Either<Failure, Article>> call(String articleId) async {
    return await repository.getSingleArticle(articleId);
  }
}
