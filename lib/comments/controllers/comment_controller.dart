import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import '../models/comment.dart';

class CommentsControllerNotifier
    extends FamilyAsyncNotifier<List<Comment>, String> {
  @override
  Future<List<Comment>> build(String postId) async {
    return fetchComments(postId);
  }

  Future<List<Comment>> fetchComments(String postId) async {
    final supabase = ref.read(supabaseClientProvider);

    final response = await supabase
        .from('comments')
        .select()
        .eq('post_id', postId);

    return (response as List)
        .map((comment) => Comment.fromJson(comment))
        .toList();
  }

  Future<void> addComment(String postId, String content) async {
    final supabase = ref.read(supabaseClientProvider);
    final user = ref.read(currentUserProvider);

    if (user == null) {
      state = AsyncValue.error('Not authenticated', StackTrace.current);
      return;
    }

    // Optimistic update
    final newComment = Comment(
      id: '-1', // temporary id until the comment is inserted
      content: content,
      likesCount: 0,
    );
    state = AsyncValue.data([...?state.value, newComment]);

    state = await AsyncValue.guard(() async {
      await supabase.from('comments').insert({
        'content': content,
        'post_id': postId,
        'user_id': user.id,
      });
      return await fetchComments(postId);
    });
  }

  Future<void> updateComment(String postId, int commentId, int likes) async {
    final supabase = ref.read(supabaseClientProvider);

    // Optimistic update
    final updated =
        state.value!.map((c) {
          return c.id == commentId.toString()
              ? c.copyWith(likesCount: likes)
              : c;
        }).toList();
    state = AsyncValue.data(updated);

    state = await AsyncValue.guard(() async {
      await supabase
          .from('comments')
          .update({'likesCount': likes})
          .eq('id', commentId);
      return await fetchComments(postId);
    });
  }

  Future<void> deleteComment(String postId, int commentId) async {
    final supabase = ref.read(supabaseClientProvider);

    // Optimistic update
    final updated =
        state.value!.where((c) => c.id != commentId.toString()).toList();
    state = AsyncValue.data(updated);

    state = await AsyncValue.guard(() async {
      await supabase.from('comments').delete().eq('id', commentId);
      return await fetchComments(postId);
    });
  }
}

// Provider family
final commentsControllerProvider = AsyncNotifierProviderFamily<
  CommentsControllerNotifier,
  List<Comment>,
  String
>(CommentsControllerNotifier.new);
