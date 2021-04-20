import '../../../core/params/categories_request_param.dart';
import '../../../domain/entities/categories/category.dart';
import '../../../core/resourses/data_state.dart';

abstract class CategoriesRepository {
  Future<DataState<List<Category>>> getAllCategories(
    CategoriesRequestParams params,
  );
}
