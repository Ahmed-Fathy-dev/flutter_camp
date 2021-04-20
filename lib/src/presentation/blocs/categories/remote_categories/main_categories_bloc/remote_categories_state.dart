part of 'remote_categories_bloc.dart';


abstract class RemoteCategoriesState extends Equatable {
  const RemoteCategoriesState({
    this.mainCategories,
    this.error,
  });

  final List<Category> mainCategories;

  final DioError error;

  @override
  List<Object> get props => [mainCategories, error];
}

class RemoteCategoriesloading extends RemoteCategoriesState {
  const RemoteCategoriesloading();
}

class RemoteCategoriesLoadSuccess extends RemoteCategoriesState {
  const RemoteCategoriesLoadSuccess(
    List<Category> mainCategory,
  ) : super(
          mainCategories: mainCategory,
        );
}

class RemoteCategoriesFailed extends RemoteCategoriesState {
  const RemoteCategoriesFailed(DioError dioError) : super(error: dioError);
}
