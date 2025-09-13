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

    state = await AsyncValue.guard(
      () => supabase.auth.signUp(email: email, password: password),
    );
  }

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
