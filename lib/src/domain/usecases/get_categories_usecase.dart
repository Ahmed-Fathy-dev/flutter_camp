import 'package:flutter_camp/src/core/params/categories_request_param.dart';
import 'package:flutter_camp/src/core/resourses/data_state.dart';
import 'package:flutter_camp/src/core/usecases/usecase.dart';
import 'package:flutter_camp/src/domain/entities/categories/category.dart';
import 'package:flutter_camp/src/domain/repositories/categories/categories_repository.dart';

class GetCategoriesUseCase
    implements UseCase<DataState<List<Category>>, CategoriesRequestParams> {
  final CategoriesRepository _categoriesRepository;

  GetCategoriesUseCase(this._categoriesRepository);

  @override
  Future<DataState<List<Category>>> call({
    CategoriesRequestParams params,
  }) {
    return _categoriesRepository.getAllCategories(params);
  }
}
