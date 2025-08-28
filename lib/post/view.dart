import 'package:flutter/material.dart';
import 'package:masterclass/post/widgets/instagram_card.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InstagramCard(),
          Divider(color: Colors.grey, height: 32),
          InstagramCard(),
        ],
      ),
    );
  }
}
