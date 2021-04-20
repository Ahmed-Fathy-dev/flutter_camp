import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp/src/injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './src/presentation/blocs/categories/remote_categories/main_categories_bloc/remote_categories_bloc.dart';
import './src/config/router/app_route.dart';
import 'src/config/l10n/l10n.dart';
import 'src/config/theme/app_theme.dart';
import 'src/presentation/blocs/posts/bloc/remote_articles_bloc_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteCategoriesBloc>(
          create: (_) => injector()..add(GetAllCategories()),
        ),
        BlocProvider<RemoteArticlesBlocBloc>(
          create: (_) => injector()..add(GetArticlesEvent()),
        ),
      ],
      child: MaterialApp(
        supportedLocales: L10n.lang,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: AppRouter.homePage,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (BuildContext context) => AppLocalizations.of(context).appTitle,
        theme: FlutterCampTheme.of(context),
      ),
    );
  }
}
