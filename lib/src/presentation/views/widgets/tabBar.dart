import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_camp/src/presentation/views/widgets/common_widgets.dart';
import 'package:ionicons/ionicons.dart';

import '../../blocs/categories/remote_categories/main_categories_bloc/remote_categories_bloc.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteCategoriesBloc, RemoteCategoriesState>(
      builder: (context, state) {
        if (state is RemoteCategoriesloading) {
          return const Center(child: LinearProgressIndicator());
        }
        if (state is RemoteCategoriesFailed) {
          return const Center(child: Icon(Ionicons.refresh));
        }
        if (state is RemoteCategoriesLoadSuccess) {
          return SizedBox(
            child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: Theme.of(context).indicatorColor),
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.transparent,
                isScrollable: true,
                tabs: state.mainCategories
                    .map((mainCategory) => tabBuilder(
                          title: mainCategory.name,
                          imgUrl: mainCategory.imgUrl,
                        ))
                    .toList()),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget tabBuilder({String title, String imgUrl}) {
    return Container(
      height: defaultPadding * 5,
      width: defaultPadding * 3.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: defaultPadding * 2.5,
            child: Image.network(
              imgUrl,
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
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
