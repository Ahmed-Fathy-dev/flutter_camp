part of 'remote_articles_bloc_bloc.dart';

abstract class RemoteArticlesBlocState extends Equatable {
  final List<Article> csArticles;
  final List<Article> dartArticles;
  final List<Article> flutterArticles;

  final bool csNoMoreData;
  final bool dartNoMoreData;
  final bool flutterNoMoreData;

  final DioError error;

  const RemoteArticlesBlocState({
    this.csArticles,
    this.dartArticles,
    this.flutterArticles,
    this.csNoMoreData,
    this.dartNoMoreData,
    this.flutterNoMoreData,
    this.error,
  });

  @override
  List<Object> get props => [
        csArticles,
        dartArticles,
        flutterArticles,
        csNoMoreData,
        dartNoMoreData,
        flutterNoMoreData,
        error,
      ];
}

class RemoteArticlesLoading extends RemoteArticlesBlocState {
  const RemoteArticlesLoading();
}

class RemoteArticlesLoadSuccess extends RemoteArticlesBlocState {
  const RemoteArticlesLoadSuccess({
    List<Article> csArticles,
    List<Article> dartArticles,
    List<Article> flutterArticles,
    bool csNoMoreData,
    bool dartNoMoreData,
    bool flutterNoMoreData,
  }) : super(
          csArticles: csArticles,
          dartArticles: dartArticles,
          flutterArticles: flutterArticles,
          csNoMoreData: csNoMoreData,
          dartNoMoreData: dartNoMoreData,
          flutterNoMoreData: flutterNoMoreData,
        );
}

class RemoteArticlesError extends RemoteArticlesBlocState {
  const RemoteArticlesError(DioError error) : super(error: error);
}
