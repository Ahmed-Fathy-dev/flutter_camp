import 'package:dio/dio.dart';
import '../../../../../src/data/models/articles/article_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../src/core/constants/server_addresses.dart';

part 'posts_api_service.g.dart';

@RestApi(baseUrl: baseUrlAddress)
abstract class PostsApiService {
  factory PostsApiService(Dio dio, {String baseUrl}) = _PostsApiService;

  @GET(postsAddress)
  Future<HttpResponse<List<ArticleModel>>> getAllAricles({
    @Query('category') int postCategoriesId,
    @Query('page') int page,
    @Query('per_page') int postsPerPage,
    @Query('_fields') List paramFields,
  });
}
