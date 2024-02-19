import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/src/posts/controller/post_notifier.dart';
import 'package:riverpod_app/src/posts/model/posts_model.dart';
import 'package:riverpod_app/src/posts/view/widgets/appbar.dart';
import 'package:riverpod_app/src/posts/view/widgets/post_view.dart';
import 'package:riverpod_app/src/utils/styles.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  ScrollController controller = ScrollController();
  int _displayLimit = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Posts>> getPosts = ref.watch(postProvider);
    final int offset = ref.watch(paginationProvider);

    return Scaffold(
      appBar: appbarWidget(),
      body: Padding(
        padding: mainPadding,
        child: getPosts.when(
          data: (data) {
            List<Posts> allPosts = data;
            final List<Posts> paginatedData = allPosts.sublist(
                0, (offset + _displayLimit).clamp(0, allPosts.length));

            return Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('All Posts', style: titleTextStyle),
                    ),
                  ],
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        ref.read(paginationProvider.notifier)
                            .incrementOffset(_displayLimit, allPosts.length);
                        ref.refresh(postProvider);
                      }
                      return false;
                    },
                    child: PostsView(posts: paginatedData, controller: controller),
                  ),
                ),
              ],
            );
          },
          error: (e, stk) => Center(child: Text(e.toString())),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
