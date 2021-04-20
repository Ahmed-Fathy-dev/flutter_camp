// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CategoriesApiServices implements CategoriesApiServices {
  _CategoriesApiServices(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://fluttercamp.online/wp-json/wp/v2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<List<CategoryModel>>> getAllCategoriesResponse(
      {parent, categoriesPerPage, paramFields}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'parent': parent,
      r'per_page': categoriesPerPage,
      r'_fields': paramFields
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/categories',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CategoryModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
