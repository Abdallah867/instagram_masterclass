import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/comment.dart';

class CommentsControllerNotifier
    extends FamilyAsyncNotifier<List<Comment>, int> {
  @override
  Future<List<Comment>> build(int postId) async {
    return fetchComments(postId);
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await Supabase.instance.client
        .from('comments')
        .select()
        .eq('post_id', postId);

    return (response as List)
        .map((comment) => Comment.fromJson(comment))
        .toList();
  }

  Future<void> addComment(int postId, String content) async {
    final newComment = Comment(
      id: '-1', // temporary ID until DB assigns one
      content: content,
      likesCount: 0,
    );

    // Optimistic update
    state = AsyncValue.data([...?state.value, newComment]);

    try {
      await Supabase.instance.client.from('comments').insert({
        'content': content,
        'post_id': postId,
      });
      // Reload from DB to get the actual record with ID
      state = AsyncValue.data(await fetchComments(postId));
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateComment(int postId, int commentId, int likes) async {
    // Optimistic update
    final updated =
        state.value?.map((c) {
          return c.id == commentId ? c.copyWith(likesCount: likes) : c;
        }).toList();

    state = AsyncValue.data(updated ?? []);

    try {
      await Supabase.instance.client
          .from('comments')
          .update({'likesCount': likes})
          .eq('id', commentId);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteComment(int postId, int commentId) async {
    // Optimistic update
    final updated = state.value?.where((c) => c.id != commentId).toList() ?? [];

    state = AsyncValue.data(updated);

    try {
      await Supabase.instance.client
          .from('comments')
          .delete()
          .eq('id', commentId);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// Provider family
final commentsControllerProvider =
    AsyncNotifierProviderFamily<CommentsControllerNotifier, List<Comment>, int>(
      CommentsControllerNotifier.new,
    );
