import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp/src/config/router/app_route.dart';
import 'package:flutter_camp/src/domain/entities/articles/article.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../../src/presentation/blocs/posts/bloc/remote_articles_bloc_bloc.dart';
import '../../../../../src/presentation/views/screens/homepage/components/article_item_widget.dart';
import '../../../../../src/core/bloc/blocWithState.dart';

class AndroidHomePageBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
      return scrollController.dispose;
    }, [scrollController]);
    return TabBarView(children: [
      BlocBuilder<RemoteArticlesBlocBloc, RemoteArticlesBlocState>(
          builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteArticlesLoadSuccess) {
          return ListView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            children: [
              ...List.from(
                state.csArticles.map(
                  (article) => Builder(
                    builder: (ctx) => ArticleItem(
                        article: article,
                        onArticlePressed: (e) => _onArticlePressed(ctx, e)),
                  ),
                ),
              ),
              if (state.csNoMoreData) ...[
                const SizedBox(),
              ] else ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: CupertinoActivityIndicator(),
                ),
              ],
            ],
          );
        }
        return const SizedBox();
      }),
      BlocBuilder<RemoteArticlesBlocBloc, RemoteArticlesBlocState>(
          builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteArticlesLoadSuccess) {
          return ListView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            children: [
              ...List.from(
                state.dartArticles.map(
                  (article) => Builder(
                    builder: (ctx) => ArticleItem(
                        article: article,
                        onArticlePressed: (e) => _onArticlePressed(ctx, e)),
                  ),
                ),
              ),
              if (state.dartNoMoreData) ...[
                const SizedBox(),
              ] else ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: CupertinoActivityIndicator(),
                ),
              ]
            ],
          );
        }
        return const SizedBox();
      }),
      BlocBuilder<RemoteArticlesBlocBloc, RemoteArticlesBlocState>(
          builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticlesError) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteArticlesLoadSuccess) {
          return ListView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              children: [
                ...List.from(
                  state.flutterArticles.map(
                    (article) => Builder(
                      builder: (ctx) => ArticleItem(
                          article: article,
                          onArticlePressed: (e) => _onArticlePressed(ctx, e)),
                    ),
                  ),
                ),
                if (state.flutterNoMoreData) ...[
                  const SizedBox(),
                ] else ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: CupertinoActivityIndicator(),
                  ),
                ]
              ]);
        }
        return const SizedBox();
      })
    ]);
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteArticleBloc = BlocProvider.of<RemoteArticlesBlocBloc>(context);
    final state = remoteArticleBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      remoteArticleBloc.add(const GetArticlesEvent());
    }
    remoteArticleBloc.close();
  }

  void _onArticlePressed(BuildContext ctx, Article article) {
    Navigator.pushNamed(ctx, AppRouter.postDetailPage, arguments: article);
  }
}
