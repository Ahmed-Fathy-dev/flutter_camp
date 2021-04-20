import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T onData;
  final DioError onError;

  const DataState({this.onData, this.onError});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(onData: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioError error) : super(onError: error);
}
