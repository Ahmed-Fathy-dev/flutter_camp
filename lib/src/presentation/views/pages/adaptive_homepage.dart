import 'package:flutter/material.dart';

import '../../../../src/presentation/views/widgets/common_widgets.dart';
import '../../../../src/presentation/views/widgets/custom_drawer.dart';
import '../../../../src/presentation/views/platforms_widget.dart';
import '../screens/homepage/android_homepage_body.dart';
import '../../../../src/presentation/views/screens/homepage/ios_homepage.dart';

class AdaptiveHomePage extends StatelessWidget {
  final String title;
  const AdaptiveHomePage({this.title});

  Widget _iosHomepageBuilder(BuildContext context) {
    return IosHomePage();
  }

  Widget _androidHomepageBuilder(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar:buildAppBar(context, title),
        drawer: CustomDrawer(),
        body: AndroidHomePageBody(),
      ),
    );
  }

  Widget _desktopHomePageBuilder(BuildContext context) {
    return Scaffold(body: AndroidHomePageBody());
  }

  @override
  Widget build(BuildContext context) {
    return PlatformsWidget(
      androidBuilder: _androidHomepageBuilder,
      iosBuilder: _iosHomepageBuilder,
      desktopBuilder: _desktopHomePageBuilder,
    );
  }
}
