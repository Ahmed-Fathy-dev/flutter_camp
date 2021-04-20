import 'package:flutter/material.dart';
import 'package:flutter_camp/src/domain/entities/articles/article.dart';
import 'package:flutter_camp/src/presentation/views/pages/adaptive_post_detail_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './rout_exception.dart';
import '../../../src/presentation/views/pages/adaptive_homepage.dart';

class AppRouter {
  static const String homePage = 'HomePage';
  static const String postDetailPage = 'Post Detail';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (ctx) => AdaptiveHomePage(
            title: AppLocalizations.of(ctx).homepageTitle,
          ),
        );
        break;
      case postDetailPage:
        return MaterialPageRoute(
          builder: (_) => AdaptivePostDetailsPage(
            article: settings.arguments as Article,
          ),
        );
        break;
      default:
        throw const RouteException('Route not found!');
    }
  }
}
