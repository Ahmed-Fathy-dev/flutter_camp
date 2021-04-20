import '../constants/server_addresses.dart';

class CsArticlesRequestParams {
  final int csPostCategoryId;
  final int csPage;
  final int csPostsPerPage;
  final List<String> csPostsParamFields;

  CsArticlesRequestParams({
    this.csPostCategoryId = csPostsCategoriesIdC,
    this.csPage = pageC,
    this.csPostsPerPage = postsPerPageC,
    this.csPostsParamFields = postsParamFieldsC,
  });
}
class DartArticlesRequestParams {
  final int dartPostCategoryId;
  final int dartPage;
  final int dartPostsPerPage;
  final List<String> dartPostsParamFields;

  DartArticlesRequestParams({
    this.dartPostCategoryId = dartPostsCategoriesIdC,
    this.dartPage = pageC,
    this.dartPostsPerPage = postsPerPageC,
    this.dartPostsParamFields = postsParamFieldsC,
  });
}
class FlutterArticlesRequestParams {
  final int flutterPostCategoryId;
  final int flutterPage;
  final int flutterPostsPerPage;
  final List<String> flutterPostsParamFields;

  FlutterArticlesRequestParams({
    this.flutterPostCategoryId = flutterPostsCategoriesIdC,
    this.flutterPage = pageC,
    this.flutterPostsPerPage = postsPerPageC,
    this.flutterPostsParamFields = postsParamFieldsC,
  });
}
