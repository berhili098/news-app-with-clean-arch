import 'package:cleanarch/core/resources/data_state.dart';
import 'package:cleanarch/core/usecases/usecase.dart';
import 'package:cleanarch/features/daily_news/domain/entities/article_entity.dart';
import 'package:cleanarch/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
