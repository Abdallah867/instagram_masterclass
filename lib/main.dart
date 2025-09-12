import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masterclass/auth/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'post/view.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final currentUserProvider = Provider((ref) {
  final supabase = ref.watch(supabaseClientProvider);

  return supabase.auth.currentUser;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dbqptpcudrkznuejgluk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRicXB0cGN1ZHJrem51ZWpnbHVrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY4NDQ5NDUsImV4cCI6MjA3MjQyMDk0NX0.WPHG_GaFjk7ID1AzxX3i1hRDa-ouifOnABlpeV-1uQE',
  );

  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Consumer(
        builder: (context, ref, child) {
          final User? currentUser = ref.watch(currentUserProvider);
          return Scaffold(
            body:
                currentUser != null
                    ? SafeArea(child: PostsView())
                    : SafeArea(child: LoginScreen()),
          );
        },
      ),
    );
  }
}
