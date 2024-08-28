import 'package:flutter/material.dart';

class BottomNavIteam extends StatelessWidget {
  const BottomNavIteam({super.key, required this.icon, this.active = false});
  final Widget icon;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? const Color(0xff03A1A4) : null),
      child: icon,
    );
  }
}
