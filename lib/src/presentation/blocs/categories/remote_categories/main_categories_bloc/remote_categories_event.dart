part of 'remote_categories_bloc.dart';

abstract class RemoteCategoriesEvent extends Equatable {
  const RemoteCategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategories extends RemoteCategoriesEvent {
  const GetAllCategories();
}



