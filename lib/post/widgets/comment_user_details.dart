import 'package:flutter/material.dart';

class CommentUserDetails extends StatelessWidget {
  const CommentUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 8),
        Text('21m', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}
