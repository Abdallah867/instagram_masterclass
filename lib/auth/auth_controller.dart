import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masterclass/main.dart';

class AuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // Nothing to return, controller only manages auth state
  }

  Future<void> signUp(String email, String password) async {
    state = const AsyncLoading();

    final supabase = ref.read(supabaseClientProvider);

    await supabase.auth.signUp(email: email, password: password);

    await AsyncValue.guard(
      () => supabase.auth.signInWithPassword(email: email, password: password),
    );
  }

  /*************  ✨ Windsurf Command ⭐  *************/
  /// Signs in to the Supabase instance with the given email and password.
  ///
  /// The [state] of the [AuthController] is set to [AsyncLoading] while
  /// the sign in operation is in progress. On completion, the [state] is
  /// set to the result of the sign in operation.
  ///
  /// Throws a [Future<void>] if the sign in operation fails.
  /// *****  0e3345c8-ee95-4a5c-9164-9cc7706346b0  ******
  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();

    final supabase = ref.read(supabaseClientProvider);

    state = await AsyncValue.guard(
      () => supabase.auth.signInWithPassword(email: email, password: password),
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    final supabase = ref.read(supabaseClientProvider);

    state = await AsyncValue.guard(() => supabase.auth.signOut());
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  AuthController.new,
);
