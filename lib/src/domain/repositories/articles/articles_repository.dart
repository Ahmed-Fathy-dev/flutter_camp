import '../../../core/params/articles_request_param.dart';
import '../../../core/resourses/data_state.dart';
import '../../entities/articles/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getCsArticles(
      CsArticlesRequestParams csArticlesParam);
  Future<DataState<List<Article>>> getDartArticles(
      DartArticlesRequestParams dartArticlesParam);
  Future<DataState<List<Article>>> getFlutterArticles(
      FlutterArticlesRequestParams flutterArticlesParam);
}
