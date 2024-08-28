import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:flutter/material.dart';

class DrawerIteam extends StatelessWidget {
  const DrawerIteam(
      {super.key,
      required this.iconData,
      required this.txt,
      this.onPressed,
      this.logOut = false});

  final IconData iconData;
  final String txt;
  final bool logOut;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: logOut ? Colors.red : Colors.black,
            ),
            const HorizantelSpace(12),
            Text(
              txt,
              style: TextStyle(
                fontSize: 15,
                color: logOut ? Colors.red : const Color(0xff393939),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.keyboard_arrow_right_outlined,
              ),
            )
          ],
        ),
        const VerticalSpace(12),
        const Divider(
          color: Color(0xffEDEDED),
          thickness: 1,
        )
      ],
    );
  }
}
