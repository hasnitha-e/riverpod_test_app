import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/src/posts/model/posts_model.dart';
import 'package:riverpod_app/src/utils/constants.dart';


final postProvider = FutureProvider<List<Posts>>((ref) async {
  Dio dio = Dio();
  final response = await dio.get(base_url+'/posts');
  final postlist = (response.data as List)
      .map((e) => Posts.fromJson(e))
      .toList();
return postlist;
});
