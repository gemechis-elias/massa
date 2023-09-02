import 'package:smart_gebere/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../repositories/article_repository.dart';

class GetTagsUseCase {
  final ArticleRepository repository;

  GetTagsUseCase(this.repository);

  Future<Either<Failure, List<String>>> call() async {
    return await repository.getTags();
  }
}
