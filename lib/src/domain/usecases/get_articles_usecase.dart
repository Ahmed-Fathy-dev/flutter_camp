import '../../../src/core/params/articles_request_param.dart';
import '../../../src/core/resourses/data_state.dart';
import '../../../src/core/usecases/usecase.dart';
import '../../../src/domain/entities/articles/article.dart';
import '../../domain/repositories/articles/articles_repository.dart';

class GetCsArticlesUsecase
    implements UseCase<DataState<List<Article>>, CsArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetCsArticlesUsecase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({CsArticlesRequestParams params}) {
    return _articlesRepository.getCsArticles(params);
  }
}

class GetDartArticlesUsecase
    implements UseCase<DataState<List<Article>>, DartArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetDartArticlesUsecase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({DartArticlesRequestParams params}) {
    return _articlesRepository.getDartArticles(params);
  }
}

class GetFlutterArticlesUsecase
    implements UseCase<DataState<List<Article>>, FlutterArticlesRequestParams> {
  final ArticlesRepository _articlesRepository;

  GetFlutterArticlesUsecase(this._articlesRepository);

  @override
  Future<DataState<List<Article>>> call({FlutterArticlesRequestParams params}) {
    return _articlesRepository.getFlutterArticles(params);
  }
}
