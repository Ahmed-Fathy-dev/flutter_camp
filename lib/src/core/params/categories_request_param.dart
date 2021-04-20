import '../constants/server_addresses.dart';

class CategoriesRequestParams {
  final int parent;
  final int categoriesPerPage;
  final List<String> paramFields;

  CategoriesRequestParams({
    this.parent = categoriesParentParam,
    this.categoriesPerPage = categoriesParamPerPage,
    this.paramFields = categoriesParamFields,
  });
}
