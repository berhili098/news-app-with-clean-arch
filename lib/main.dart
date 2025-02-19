import 'package:cleanarch/config/theme/app_theme.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:cleanarch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:cleanarch/features/daily_news/presentation/pages/home/daily_news_page.dart';
import 'package:cleanarch/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (BuildContext context) => sl<RemoteArticleBloc>()..add(const GetArticles()),
      child: MaterialApp(title: 'Flutter Demo', theme: theme, home: DailyNewsPage()));
  }
}
