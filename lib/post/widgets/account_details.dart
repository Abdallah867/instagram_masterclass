import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  final String username;
  const AccountDetails({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20, backgroundColor: Colors.red),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Suggested for you',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
