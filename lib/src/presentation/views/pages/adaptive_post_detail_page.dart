import 'package:flutter/material.dart';
import '../screens/article_details/android_post_details_body.dart';
import '../../../../src/domain/entities/articles/article.dart';
import '../platforms_widget.dart';

class AdaptivePostDetailsPage extends StatelessWidget {
  final Article article;
  const AdaptivePostDetailsPage({Key key, this.article}) : super(key: key);

  Widget _androidPostDetailsPageBuilder(BuildContext ctx) {
    return AndroidPostDetailsBody(article: this.article);
  }

  Widget _iosPostDetailsPageBuilder(BuildContext ctx) {
    return AndroidPostDetailsBody(article: article);
  }

  Widget _desktopPostDetailsPageBuilder(BuildContext ctx) {
    return AndroidPostDetailsBody(article: this.article);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformsWidget(
      androidBuilder: _androidPostDetailsPageBuilder,
      iosBuilder: _iosPostDetailsPageBuilder,
      desktopBuilder: _desktopPostDetailsPageBuilder,
    );
  }
}
