import 'package:flutter/material.dart';
import 'package:flutter_camp/src/domain/entities/categories/category.dart';

class MainCategoryWidget extends StatelessWidget {
  const MainCategoryWidget({
    this.category,
    this.onPressed,
  });
  final Category category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Text(
          category.name,
        ),
      ),
    );
  }
}
