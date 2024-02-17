

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/posts/controller/post_notifier.dart';
import 'package:riverpod_app/features/posts/model/posts_model.dart';
import 'package:riverpod_app/features/posts/view/widgets/appbar.dart';
import 'package:riverpod_app/features/posts/view/widgets/post_view.dart';
import 'package:riverpod_app/features/utils/styles.dart';


class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    AsyncValue<List<Posts>> getposts=ref.watch(postProvider);
    return Scaffold(
        appBar: appbarWidget(),
        body: Padding(
            padding: mainPadding,
            child:getposts.when(data:(data)=>Column(
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
                      child: PostsView(posts: data ),
                    ),
                  ],
                ), error: (e,stk)=>Center(child: Text(e.toString()),), loading: ()=>Center(child: CircularProgressIndicator(),))
        
        
              ));
              }
            }
  

