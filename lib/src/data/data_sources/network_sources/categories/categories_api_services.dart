import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../data/models/categories/categories_model.dart';
import '../../../../core/constants/server_addresses.dart';

part 'categories_api_services.g.dart';

@RestApi(baseUrl: baseUrlAddress)
abstract class CategoriesApiServices {
  factory CategoriesApiServices(Dio dio, {String baseUrl}) =
      _CategoriesApiServices;
  @GET(categoriesAddress)
  Future<HttpResponse<List<CategoryModel>>> getAllCategoriesResponse({
    @Query('parent') int  parent,
    @Query('per_page') int categoriesPerPage ,
    @Query('_fields') List  paramFields ,
  });
}
