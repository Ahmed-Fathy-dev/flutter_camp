import 'package:dio/dio.dart';
import 'package:flutter_camp/src/presentation/blocs/posts/bloc/remote_articles_bloc_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/network_sources/articles/posts_api_service.dart';
import 'data/data_sources/network_sources/categories/categories_api_services.dart';
import 'data/repositories/articles_repository_impl.dart';
import 'data/repositories/categories_repository_impl.dart';
import 'domain/repositories/articles/articles_repository.dart';
import 'domain/repositories/categories/categories_repository.dart';
import 'domain/usecases/get_articles_usecase.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'presentation/blocs/categories/remote_categories/main_categories_bloc/remote_categories_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<CategoriesApiServices>(
    CategoriesApiServices(
      injector(),
    ),
  );
  injector.registerSingleton<PostsApiService>(
    PostsApiService(
      injector(),
    ),
  );
  // *
  injector.registerSingleton<CategoriesRepository>(
    CategoriesRepositoryImpl(
      injector(),
    ),
  );
  injector.registerSingleton<ArticlesRepository>(
    ArticleRepositoryImpl(
      injector(),
    ),
  );

  // UseCases
  injector.registerSingleton<GetCategoriesUseCase>(
      GetCategoriesUseCase(injector()));
  injector.registerSingleton<GetCsArticlesUsecase>(
      GetCsArticlesUsecase(injector()));
  injector.registerSingleton<GetDartArticlesUsecase>(
      GetDartArticlesUsecase(injector()));
  injector.registerSingleton<GetFlutterArticlesUsecase>(
      GetFlutterArticlesUsecase(injector()));

  // Blocs
  injector.registerFactory<RemoteCategoriesBloc>(
    () => RemoteCategoriesBloc(injector()),
  );
  injector.registerFactory<RemoteArticlesBlocBloc>(
    () => RemoteArticlesBlocBloc(injector(), injector(), injector(),),
  );
}
