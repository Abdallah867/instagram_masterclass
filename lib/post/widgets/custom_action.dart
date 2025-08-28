import 'package:flutter/material.dart';

class CustomAction extends StatelessWidget {
  final IconData icon;
  const CustomAction({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Row(children: [Icon(icon, size: 28), Text('1,024')]),
    );
  }
}
