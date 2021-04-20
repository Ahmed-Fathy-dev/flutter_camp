import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../src/core/constants/server_addresses.dart';
import '../../../../../src/core/params/articles_request_param.dart';
import '../../../../../src/core/resourses/data_state.dart';
import '../../../../../src/domain/usecases/get_articles_usecase.dart';
import '../../../../../src/domain/entities/articles/article.dart';
import '../../../../core/bloc/blocWithState.dart';

part 'remote_articles_bloc_event.dart';
part 'remote_articles_bloc_state.dart';

class RemoteArticlesBlocBloc
    extends BlocWithState<RemoteArticlesBlocEvent, RemoteArticlesBlocState> {
  final GetCsArticlesUsecase _getCsArticlesUseCase;
  final GetDartArticlesUsecase _getDartArticlesUseCase;
  final GetFlutterArticlesUsecase _getFlutterArticlesUseCase;

  RemoteArticlesBlocBloc(
    this._getCsArticlesUseCase,
    this._getDartArticlesUseCase,
    this._getFlutterArticlesUseCase, {
    DioError error,
  }) : super(
          const RemoteArticlesLoading(),
        );
  final List<Article> _csArticles = [];
  final List<Article> _flutterArticles = [];
  final List<Article> _dartArticles = [];

  int _csPage = pageC;
  int _dartPage = pageC;
  int _flutterPage = pageC;

  static const int _postsPerPage = postsPerPageC;

  @override
  Stream<RemoteArticlesBlocState> mapEventToState(
    RemoteArticlesBlocEvent event,
  ) async* {
    if (event is GetArticlesEvent) yield* getAllArticles(event);
  }

  Stream<RemoteArticlesBlocState> getAllArticles(
      RemoteArticlesBlocEvent event) async* {
    yield* runBlocProcess(() async* {
      final csArticlesDataState = await _getCsArticlesUseCase(
          params: CsArticlesRequestParams(
        csPage: _csPage,
      ));
      final dartArticlesDataState = await _getDartArticlesUseCase(
          params: DartArticlesRequestParams(
        dartPage: _dartPage,
      ));
      final flutterArticlesDataState = await _getFlutterArticlesUseCase(
          params: FlutterArticlesRequestParams(
        flutterPage: _flutterPage,
      ));
      if (csArticlesDataState is DataSuccess &&
              csArticlesDataState.onData.isNotEmpty ||
          dartArticlesDataState is DataSuccess &&
              dartArticlesDataState.onData.isNotEmpty ||
          flutterArticlesDataState is DataSuccess &&
              flutterArticlesDataState.onData.isNotEmpty) {
        final csArticlesFromData = csArticlesDataState.onData;
        final csNoMoreData = csArticlesFromData.length < _postsPerPage;
        _csArticles.addAll(csArticlesFromData);
        _csPage++;
        final dartArticlesFromData = dartArticlesDataState.onData;
        final dartNoMoreData = dartArticlesFromData.length < _postsPerPage;
        _dartArticles.addAll(dartArticlesFromData);
        _dartPage++;
        final flutterArticlesFromData = flutterArticlesDataState.onData;
        final flutterNoMoreData =
            flutterArticlesFromData.length < _postsPerPage;
        _flutterArticles.addAll(flutterArticlesFromData);
        _flutterPage++;
        yield RemoteArticlesLoadSuccess(
            csArticles: _csArticles,
            dartArticles: _dartArticles,
            flutterArticles: _flutterArticles,
            csNoMoreData: csNoMoreData,
            dartNoMoreData: dartNoMoreData,
            flutterNoMoreData: flutterNoMoreData);
      }
      if (csArticlesDataState is DataFailed ||
          dartArticlesDataState is DataFailed ||
          flutterArticlesDataState is DataFailed) {
        yield RemoteArticlesError(
          csArticlesDataState.onError,
        );
        yield RemoteArticlesError(
          dartArticlesDataState.onError,
        );
        yield RemoteArticlesError(
          flutterArticlesDataState.onError,
        );
      }
    });
  }
}
/*
if (csArticlesDataState is DataSuccess &&
              csArticlesDataState.onData.isNotEmpty ||
          dartArticlesDataState is DataSuccess &&
              dartArticlesDataState.onData.isNotEmpty ||
          flutterArticlesDataState is DataSuccess &&
              flutterArticlesDataState.onData.isNotEmpty) {
        final csArticlesFromData = csArticlesDataState.onData;
        final csNoMoreData = csArticlesFromData.length < _postsPerPage;
        _csArticles.addAll(csArticlesFromData);
        _csPage++;
        final dartArticlesFromData = dartArticlesDataState.onData;
        final dartNoMoreData = dartArticlesFromData.length < _postsPerPage;
        _dartArticles.addAll(dartArticlesFromData);
        _dartPage++;
        final flutterArticlesFromData = flutterArticlesDataState.onData;
        final flutterNoMoreData =
            flutterArticlesFromData.length < _postsPerPage;
        _flutterArticles.addAll(flutterArticlesFromData);
        _flutterPage++;
        yield RemoteArticlesLoadSuccess(
            csArticles: _csArticles,
            dartArticles: _dartArticles,
            flutterArticles: _flutterArticles,
            csNoMoreData: csNoMoreData,
            dartNoMoreData: dartNoMoreData,
            flutterNoMoreData: flutterNoMoreData);
      }

 */
