import 'package:flutter/material.dart';
import 'package:riverpod_app/src/posts/model/posts_model.dart';
import 'package:riverpod_app/src/posts/view/widgets/posts_card.dart';

class PostsGrid extends StatelessWidget {
   PostsGrid({
    super.key,
    required this.posts,
    required this.crosscount,required this.controller
  });

  final List<Posts> posts;
  final int crosscount;
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: crosscount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return PostCard(post: posts[index]);
      },
      itemCount: posts.length,
    );
  }
}
