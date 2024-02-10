import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 50,
        child: Center(
          child: Icon(Icons.person, size: 100, color: Colors.white),
        ),
      ),
    );
  }
}
