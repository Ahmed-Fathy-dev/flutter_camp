import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final int categories;
  final String title;
  final String excerpt;
  final String content;
  final String imageUrl;
  final String postDate;

  const Article({
    this.id,
    this.categories,
    this.title,
    this.excerpt,
    this.content,
    this.imageUrl,
    this.postDate
  });

  @override
  List<Object> get props => [
        id,
        title,
        categories,
        excerpt,
        content,
        imageUrl,
        postDate
      ];

  @override
  bool get stringify => true;
}
