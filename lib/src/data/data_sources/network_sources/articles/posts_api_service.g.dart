// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PostsApiService implements PostsApiService {
  _PostsApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://fluttercamp.online/wp-json/wp/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<List<ArticleModel>>> getAllAricles(
      {postCategoriesId, page, postsPerPage, paramFields}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'categories': postCategoriesId,
      r'page': page,
      r'per_page': postsPerPage,
      r'_fields': paramFields
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/posts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => ArticleModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
