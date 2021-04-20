import '../../../../src/domain/entities/articles/article.dart';

class ArticleModel extends Article {
  ArticleModel({
    int id,
    int categoriesId,
    String title,
    String excerpt,
    String content,
    String imageUrl,
    String date,
  }) : super(
          id: id,
          categories: categoriesId,
          title: title,
          excerpt: excerpt,
          content: content,
          imageUrl: imageUrl,
          postDate: date,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
    return ArticleModel(
      id: map['id'] as int,
      categoriesId: map ['categories'] as int,
      title: map['title']['rendered'] as String,
      excerpt: map['excerpt']['rendered'] as String,
      content: map['content']['rendered'] as String,
      imageUrl: map['jetpack_featured_media_url'] as String,
      date: map['date'] as String,
    );
  }
}
