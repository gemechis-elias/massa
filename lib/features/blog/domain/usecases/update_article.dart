import '../entities/article.dart';
import '../repositories/article_repository.dart';

class UpdateArticleUseCase {
  final ArticleRepository repository;

  UpdateArticleUseCase(this.repository);

  Future<void> call(Article article) async {
    await repository.updateArticle(article);
  }
}
