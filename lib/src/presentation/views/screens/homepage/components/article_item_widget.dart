import 'package:flutter/material.dart';
import 'package:flutter_camp/src/core/constants/strings.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import '../../../../../../src/presentation/views/widgets/common_widgets.dart';
import 'package:flutter_camp/src/domain/entities/articles/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  final void Function(Article article) onArticlePressed;

  const ArticleItem({
    Key key,
    @required this.article,
    this.onArticlePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: mediaQuery.width * .8,
      height: mediaQuery.height * .49,
      child: InkWell(
        onTap: _onTap,
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          elevation: 2,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: defaultPadding * 8,
                child: Hero(
                  tag: 'PImg',
                  child: Image.network(
                    article.imageUrl ?? '',
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (_, __, ___) {
                      return Center(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                Strings.failedToLoadImg,
                              ),
                              IconButton(
                                  icon: Icon(Icons.refresh), onPressed: () {})
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.height * .09,
                color: Colors.cyan[400],
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: titlePostWidget(
                      title: article.title ?? '',
                      textStyle: Theme.of(context).textTheme.subtitle1,
                      maxLine: 1),

                  /* Text(
                    article.title ?? '',
                    maxLines: 1,
                    textDirection: textDirection,
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Html(data: article.title ?? '', style: {
                    'h1': Style(
                        direction: TextDirection.rtl, color: Colors.white),
                  }),
                ),*/
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Container(
                  width: mediaQuery.height * .48,
                  height: mediaQuery.height * .10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child:
                        /* Text(
                      excerpt,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.right,
                    ),*/
                        Html(
                      data: article.excerpt ?? '',
                      style: {
                        'p': Style(direction: TextDirection.rtl),
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      Icons.bookmark_border,
                      size: mediaQuery.height * .045,
                    ),
                    onPressed: () {},
                  ),
                  Text(article.postDate ?? ''),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed(article);
    }
  }
}
