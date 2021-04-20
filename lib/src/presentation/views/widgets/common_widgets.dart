import 'package:flutter/material.dart';
import 'package:flutter_camp/src/presentation/views/widgets/tabBar.dart';
import '../../../../src/presentation/views/screens/homepage/components/search_bar.dart';

const double defaultPadding = 20.0;
const TextDirection textDirection = TextDirection.rtl;
//appBar builder function
PreferredSizeWidget buildAppBar(
  BuildContext ctx,
  String title,
) {
  return AppBar(
    title: Text(
      title,
    ),
    actions: [
      searchIconBtnbuilder(
        ctx,
      ),
    ],
    leading: Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.segment),
        onPressed: () => Scaffold.of(context).openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.square(100),
      child: CustomTabBar(),
    ),
  );
}

Widget titlePostWidget({TextStyle textStyle, String title,int maxLine}) {
  return Directionality(
    textDirection:textDirection,
    child: Text(
      title ?? '',
      maxLines: maxLine,
      textAlign: TextAlign.right,
      style: textStyle,
    ),
  );
}

Widget searchIconBtnbuilder(
  BuildContext context,
) {
  return IconButton(
    icon: Icon(Icons.search, color: null),
    onPressed: () {
      showSearch(
        context: context,
        delegate: SearchBar(),
      );
    },
  );
}
