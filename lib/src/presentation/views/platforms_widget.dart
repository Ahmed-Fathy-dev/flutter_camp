import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformsWidget extends StatelessWidget {
  PlatformsWidget({
    Key key,
    @required this.androidBuilder,
    @required this.iosBuilder,
    this.desktopBuilder,
  })  : assert(androidBuilder != null),
        assert(iosBuilder != null),
        super(key: key);
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;
  final WidgetBuilder desktopBuilder;
  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
        break;
      case TargetPlatform.iOS:
        return iosBuilder(context);
        break;
      case TargetPlatform.windows:
        return desktopBuilder(context);
        break;
      case TargetPlatform.macOS:
        return desktopBuilder(context);
        break;
      case TargetPlatform.linux:
        return desktopBuilder(context);
        break;
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return SizedBox.shrink();
    }
  }
}
