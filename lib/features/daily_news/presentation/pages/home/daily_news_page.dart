import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: body);
  }

  AppBar get appBar => AppBar(title: const Text('Daily News', style: TextStyle(color: Colors.black)));

  BlocBuilder<RemoteArticleBloc, RemoteArticleState> get body => BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (BuildContext context, RemoteArticleState state) {
      if (state is RemoteArticlesLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is RemoteArticlesLoaded) {
        return ListView.builder(
          itemCount: state.articles?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final article = state.articles![index];
            return ListTile(
              title: Text(article.title ?? "test nuullll"),
              subtitle: Text(article.description ?? "test null"),
            );
          },
        );
      }
      if (state is RemoteArticlesError) {
        return Center(
          child: Column(
            children: [
              Text(state.error?.message ?? "Error"),
              ElevatedButton(
                onPressed: () => context.read<RemoteArticleBloc>().add(const GetArticles()),
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }
      return const SizedBox();
    },
  );
}
