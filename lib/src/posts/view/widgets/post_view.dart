
import 'package:flutter/material.dart';
import 'package:riverpod_app/src/posts/model/posts_model.dart';
import 'package:riverpod_app/src/posts/view/widgets/post_grid.dart';
import 'package:riverpod_app/src/posts/view/widgets/posts_list.dart';

class PostsView extends StatelessWidget {
   PostsView({
    super.key,
    required this.posts,required this.controller
  });

  final List<Posts> posts;
   ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 960) {
          return PostsGrid(posts: posts, crosscount: 4,controller: controller,);
        } else if (constraints.maxWidth > 600) {
          return PostsGrid(posts: posts, crosscount: 2,controller: controller,);
        } else {
          return PostListView(posts: posts,controller: controller,);
        }
      },
    );
  }
}

