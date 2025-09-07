import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masterclass/post/models/post.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          final posts = snapshot.data ?? [];
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 12),
            itemBuilder: (context, index) {
              final post = posts[index];
              return InstagramCard(post: post);
            },
            itemCount: posts.length,
          );
        }
      },
    );
  }
}

Future<List<Post>> fetchPosts() async {
  try {
    final response = await Supabase.instance.client.from('posts').select();
    return response.map((post) => Post.fromJson(post)).toList();
  } catch (e) {
    throw Exception('Error fetching posts: $e');
  }
}

Future<List<Post>> fetchPost() async {
  try {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      return data.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  } catch (e) {
    throw Exception('Error fetching posts: $e');
  }
}



      // child: ListView.separated(
      //   separatorBuilder: (context, index) => Divider(height: 12),
      //   itemBuilder: (context, index) {
      //     final post = futurePosts[index];
      //     return InstagramCard(post: post);
      //   },
      //   itemCount: posts.length,
      // ),
