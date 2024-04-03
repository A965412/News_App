part of 'news_cubit_cubit.dart';

abstract class NewsStates {}

final class NewsIntialState extends NewsStates {}

final class NewsLoadingState extends NewsStates {}

final class NewsErrorState extends NewsStates {
  String? errormassage;

  NewsErrorState({required this.errormassage});
}

final class NewsSuccessState extends NewsStates {
  List<Article> articleList;

  NewsSuccessState({required this.articleList});
}
