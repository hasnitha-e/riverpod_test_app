import 'package:flutter/material.dart';
import 'package:riverpod_app/src/posts/model/posts_model.dart';
import 'package:riverpod_app/src/posts/view/widgets/posts_card.dart';

class PostListView extends StatelessWidget {
 PostListView({
    super.key,
    required this.posts,required this.controller
  });

  final List<Posts> posts;
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: PostCard(post: posts[index]),
        );
      },
      itemCount: posts.length,
    );
  }
}
