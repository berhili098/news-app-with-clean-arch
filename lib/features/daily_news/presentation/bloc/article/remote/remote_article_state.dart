import 'package:cleanarch/features/daily_news/domain/entities/article_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteArticleState extends Equatable{

final List<ArticleEntity> ? articles;
final DioException? error;

  const RemoteArticleState({this.articles , this.error});

  @override
  List<Object?> get props => [articles , error];
}


class RemoteArticlesLoading extends RemoteArticleState{
  const RemoteArticlesLoading();
}

class RemoteArticlesLoaded extends RemoteArticleState{
  const RemoteArticlesLoaded({required List<ArticleEntity> articles}) : super(articles: articles);
}


class RemoteArticlesError extends RemoteArticleState{
  const RemoteArticlesError({required DioException error}) : super(error: error);
}