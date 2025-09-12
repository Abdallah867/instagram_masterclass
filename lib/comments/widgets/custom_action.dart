import 'package:flutter/material.dart';

class CustomAction extends StatelessWidget {
  final IconData icon;
  final int? count;
  final VoidCallback onPressed;
  const CustomAction({
    super.key,
    required this.icon,
    required this.count,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: Icon(icon, size: 28)),
          count != null ? Text(count.toString()) : SizedBox(),
        ],
      ),
    );
  }
}
