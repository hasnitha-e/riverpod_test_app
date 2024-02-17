
import 'package:flutter/material.dart';
import 'package:riverpod_app/features/posts/model/posts_model.dart';
import 'package:riverpod_app/features/posts/view/widgets/post_grid.dart';
import 'package:riverpod_app/features/posts/view/widgets/posts_list.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    super.key,
    required this.posts,
  });

  final List<Posts> posts;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 960) {
          return PostsGrid(posts: posts, crosscount: 4);
        } else if (constraints.maxWidth > 600) {
          return PostsGrid(posts: posts, crosscount: 2);
        } else {
          return PostListView(posts: posts);
        }
      },
    );
  }
}

