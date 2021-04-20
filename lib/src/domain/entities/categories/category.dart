import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final int count;
  final String name;
  final String imgUrl;
  final int parent;

  const Category({
    this.id,
    this.count,
    this.name,
    this.imgUrl,
    this.parent,
  });

  @override
  List<Object> get props => [
        id,
        count,
        name,
        imgUrl,
        parent,
      ];
  @override
  bool get stringify => true;
}
