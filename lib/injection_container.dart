import 'package:cleanarch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:cleanarch/features/daily_news/data/repository/article_repository.dart';
import 'package:cleanarch/features/daily_news/domain/repository/article_repository.dart';
import 'package:cleanarch/features/daily_news/domain/usecases/get_article_use_case.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Use Cases
  sl.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(sl()),
  );

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl()),
  );
}
