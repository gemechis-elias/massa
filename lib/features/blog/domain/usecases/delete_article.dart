import '../repositories/article_repository.dart';

class DeleteArticleUseCase {
  final ArticleRepository repository;

  DeleteArticleUseCase(this.repository);

  call(String articleId) async {
    return await repository.deleteArticle(articleId);
  }
}
