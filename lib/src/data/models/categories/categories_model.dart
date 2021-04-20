import 'package:flutter_camp/src/domain/entities/categories/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    int id,
    int count,
    String name,
    String imgUrl,
    int parent,
  }) : super(
          id: id,
          count: count,
          name: name,
          imgUrl: imgUrl,
          parent: parent,
        );
  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
    return CategoryModel(
      id: map['id'] as int,
      parent: map['parent'] as int,
      count: map['count'] as int,
      name: map['name'] as String,
      imgUrl: map['description'] as String,
    );
  }
}
