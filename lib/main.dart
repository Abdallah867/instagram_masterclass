import 'package:flutter/material.dart';

import 'post/view.dart';
import 'shared/bottom_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        bottomNavigationBar: BottomNavigation(),

        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: Text('Explore', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: false,
          actions: [Icon(Icons.camera_alt_outlined)],
        ),

        body: SafeArea(child: PostsView()),
      ),
    );
  }
}
