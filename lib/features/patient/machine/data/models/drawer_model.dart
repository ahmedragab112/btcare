import 'package:flutter/material.dart';

class DrawerModel {
  final IconData icon;
  final String txt;
  final VoidCallback onPressed;
  final bool logOut;
  const DrawerModel(
      {required this.icon,
      required this.txt,
      required this.onPressed,
      this.logOut = false});
}

List<DrawerModel> draweIteam = [
  DrawerModel(
      icon: Icons.notifications_rounded, txt: 'Notification', onPressed: () {}),
  DrawerModel(icon: Icons.lock, txt: 'Security', onPressed: () {}),
  DrawerModel(icon: Icons.language, txt: 'Language', onPressed: () {}),
  DrawerModel(icon: Icons.info_outline, txt: 'info', onPressed: () {}),
  DrawerModel(
      icon: Icons.logout_outlined,
      txt: 'Logout',
      onPressed: () {},
      logOut: true)
];
