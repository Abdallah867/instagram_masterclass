import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:masterclass/auth/auth_controller.dart';
import 'package:masterclass/post/models/post.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';
import 'package:masterclass/shared/bottom_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final postsProvider = FutureProvider<List<Post>>((ref) async {
  return fetchPosts();
});

class PostsView extends ConsumerWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),

      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Explore', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: Consumer(
        builder: (context, ref, child) {
          final AsyncValue<List<Post>> postsAsync = ref.watch(postsProvider);

          return postsAsync.when(
            data:
                (posts) => ListView.separated(
                  separatorBuilder:
                      (context, index) => const Divider(height: 12),
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return InstagramCard(post: post);
                  },
                  itemCount: posts.length,
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text("Error: $err")),
          );
        },
      ),
    );
  }
}

Future<List<Post>> fetchPosts() async {
  final response = await Supabase.instance.client.from('posts').select();
  return response.map((post) => Post.fromJson(post)).toList();
}
