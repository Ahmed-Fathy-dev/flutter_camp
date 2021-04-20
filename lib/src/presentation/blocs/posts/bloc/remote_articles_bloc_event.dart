part of 'remote_articles_bloc_bloc.dart';

abstract class RemoteArticlesBlocEvent extends Equatable {
  const RemoteArticlesBlocEvent();

  @override
  List<Object> get props => [];
}

class GetArticlesEvent extends RemoteArticlesBlocEvent{
const  GetArticlesEvent();
}
