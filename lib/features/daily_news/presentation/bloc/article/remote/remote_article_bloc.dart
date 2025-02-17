import 'package:cleanarch/core/resources/data_state.dart';
import 'package:cleanarch/features/daily_news/domain/usecases/get_article_use_case.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;
  RemoteArticleBloc(this._getArticlesUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit)async {
    emit(RemoteArticlesLoading());
    final dataState =  await _getArticlesUseCase.call();
    if(dataState is DataSuccess && dataState.data != null){
      emit(RemoteArticlesLoaded(articles: dataState.data!));
    }
    if(dataState is DataFailed && dataState.error != null){
      emit(RemoteArticlesError(error: dataState.error!));
    }
  }
}
