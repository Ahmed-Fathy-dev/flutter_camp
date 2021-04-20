import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/resourses/data_state.dart';
import '../../core/params/categories_request_param.dart';
import '../../data/data_sources/network_sources/categories/categories_api_services.dart';
import '../../domain/entities/categories/category.dart';
import '../../domain/repositories/categories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesApiServices _categoriesApiServices;

  const CategoriesRepositoryImpl(
    this._categoriesApiServices,
  );

  @override
  Future<DataState<List<Category>>> getAllCategories(
      CategoriesRequestParams params) async {
    try {
      final httpResponse =
          await _categoriesApiServices.getAllCategoriesResponse(
              parent: params.parent,
              categoriesPerPage: params.categoriesPerPage,
              paramFields: params.paramFields);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          request: httpResponse.response.request,
          type: DioErrorType.RESPONSE,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
