
import 'package:flutter/material.dart';
import 'package:flutter_camp/src/domain/entities/articles/article.dart';
import 'package:flutter_camp/src/presentation/views/widgets/common_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class AndroidPostDetailsBody extends HookWidget {
  final Article article;
  AndroidPostDetailsBody({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                floating: true,
                snap: true,
                expandedHeight: 300,
                flexibleSpace: SafeArea(
                  top: true,
                  child: FlexibleSpaceBar(
                    title: Container(
                      padding: EdgeInsets.symmetric(horizontal:10),
                      height: defaultPadding * 3,
                      width: double.infinity,
                      color: Colors.black54,
                      child:titlePostWidget(title:article.title,textStyle:Theme.of(context).textTheme.headline2,
                      maxLine: 2),
                    ),
                    centerTitle: true,
                    titlePadding: EdgeInsets.only(top: 20),
                    background: Hero(
                      tag: 'PImg',
                      child: Image.network(
                        article.imageUrl,
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child:
                /* HtmlWidget(
              article.content,
              webViewJs: true,
              webView: true,
              webViewMediaPlaybackAlwaysAllow: true,
            ),*/
                Html(data: article.content, style: {
              'p': Style(direction: TextDirection.rtl),
            },/* customRender: {
              "iframe": (RenderContext context, Widget child,
                  Map<String, String> attributes, _) {
                if (attributes != null) {
                  double width = double.tryParse(attributes['width'] ?? "");
                  double height = double.tryParse(attributes['height'] ?? "");
                  print(attributes['src']);
                  return Container(
                    width: width ?? (height ?? 150) * 2,
                    height: height ?? (width ?? 300) / 2,
                    child: WebView(
                      initialUrl: attributes['src'],
                      javascriptMode: JavascriptMode.unrestricted,
                      //no need for scrolling gesture recognizers on embedded youtube, so set gestureRecognizers null
                      //on other iframe content scrolling might be necessary, so use VerticalDragGestureRecognizer
                      gestureRecognizers:
                          attributes['src'].contains("youtube.com/embed")
                              ? null
                              : [Factory(() => VerticalDragGestureRecognizer())]
                                  .toSet(),
                      navigationDelegate: (NavigationRequest request) async {
                        //no need to load any url besides the embedded youtube url when displaying embedded youtube, so prevent url loading
                        //on other iframe content allow all url loading
                        if (attributes['src'].contains("youtube.com/embed")) {
                          if (!request.url.contains("youtube.com/embed")) {
                            return NavigationDecision.prevent;
                          } else {
                            return NavigationDecision.navigate;
                          }
                        } else {
                          return NavigationDecision.navigate;
                        }
                      },
                    ),
                  );
                } else {
                  return Container(height: 0);
                }
              }
            }*/),
          ),
        ),
      ),
    );
  }
}
