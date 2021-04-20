import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_camp/src/core/resourses/data_state.dart';
import 'package:flutter_camp/src/core/params/articles_request_param.dart';
import 'package:flutter_camp/src/data/data_sources/network_sources/articles/posts_api_service.dart';
import 'package:flutter_camp/src/domain/entities/articles/article.dart';
import 'package:flutter_camp/src/domain/repositories/articles/articles_repository.dart';

class ArticleRepositoryImpl extends ArticlesRepository {
  final PostsApiService _articlesApiService;

  ArticleRepositoryImpl(this._articlesApiService);

  @override
  Future<DataState<List<Article>>> getCsArticles(
      CsArticlesRequestParams csArticlesParams) async {
    try {
      final httpResponse = await _articlesApiService.getAllAricles(
          postCategoriesId: csArticlesParams.csPostCategoryId,
          page: csArticlesParams.csPage,
          postsPerPage: csArticlesParams.csPostsPerPage,
          paramFields: csArticlesParams.csPostsParamFields);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        request: httpResponse.response.request,
        type: DioErrorType.RESPONSE,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<Article>>> getDartArticles(
      DartArticlesRequestParams dartArticlesParams) async {
    try {
      final httpResponse = await _articlesApiService.getAllAricles(
          postCategoriesId: dartArticlesParams.dartPostCategoryId,
          page: dartArticlesParams.dartPage,
          postsPerPage: dartArticlesParams.dartPostsPerPage,
          paramFields: dartArticlesParams.dartPostsParamFields);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        request: httpResponse.response.request,
        type: DioErrorType.RESPONSE,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<Article>>> getFlutterArticles(
      FlutterArticlesRequestParams flutterArticlesParam) async {
    try {
      final httpResponse = await _articlesApiService.getAllAricles(
          postCategoriesId: flutterArticlesParam.flutterPostCategoryId,
          page: flutterArticlesParam.flutterPage,
          postsPerPage: flutterArticlesParam.flutterPostsPerPage,
          paramFields: flutterArticlesParam.flutterPostsParamFields);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        request: httpResponse.response.request,
        type: DioErrorType.RESPONSE,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
