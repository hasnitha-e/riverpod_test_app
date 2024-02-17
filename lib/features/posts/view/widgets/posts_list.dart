import 'package:flutter/material.dart';
import 'package:riverpod_app/features/posts/model/posts_model.dart';
import 'package:riverpod_app/features/posts/view/widgets/posts_card.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
    required this.posts,
  });

  final List<Posts> posts;

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
