import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp/src/core/constants/server_addresses.dart';

import '../../../../../../src/core/params/categories_request_param.dart';
import '../../../../../../src/core/resourses/data_state.dart';
import '../../../../../../src/domain/entities/categories/category.dart';
import '../../../../../../src/domain/usecases/get_categories_usecase.dart';

part 'remote_categories_event.dart';
part 'remote_categories_state.dart';

class RemoteCategoriesBloc
    extends Bloc<RemoteCategoriesEvent, RemoteCategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  RemoteCategoriesBloc(this._getCategoriesUseCase)
      : super(const RemoteCategoriesloading());
  final List<Category> _mainCategories = [];

  @override
  Stream<RemoteCategoriesState> mapEventToState(
    RemoteCategoriesEvent event,
  ) async* {
    if (event is GetAllCategories) yield* _getAllCategories(event);
  }

  Stream<RemoteCategoriesState> _getAllCategories(
      RemoteCategoriesEvent event) async* {
    final dataState =
        await _getCategoriesUseCase(params: CategoriesRequestParams());
    if (dataState is DataSuccess && dataState.onData.isNotEmpty) {
      final mainCategories =
          dataState.onData.where((cat) => cat.parent == categoriesParentParam);
      _mainCategories.addAll(mainCategories);
      yield RemoteCategoriesLoadSuccess(
        _mainCategories,
      );
    }
    if (dataState is DataFailed) {
      yield RemoteCategoriesFailed(dataState.onError);
    }
  }
}
