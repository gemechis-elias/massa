import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/article.dart';
import '../repositories/article_repository.dart';

class GetArticleUseCase {
  final ArticleRepository repository;

  GetArticleUseCase(this.repository);

  Future<Either<Failure, List<Article>>> call() async {
    return await repository.getAllArticles();
  }
}
