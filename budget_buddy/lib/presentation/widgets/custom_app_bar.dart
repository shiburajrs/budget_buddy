import 'package:flutter/material.dart';

import '../../utils/colorUtils.dart';
import '../../utils/textStyleUtils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String leftIcon;
  final String rightIcon;
  final Function() onLeftPressed;
  final Function() onRightPressed;

  CustomAppBar({
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    required this.onLeftPressed,
    required this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.white,
      title: Text(title, style: TextUtils.getPoppinsBold(fontSize: 20.0, color: Colors.black),),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset(leftIcon,height: 20,width: 20,),
        onPressed: onLeftPressed,
      ),
      actions: [
        IconButton(
          icon: Image.asset(rightIcon,height: 20,width: 20,),
          onPressed: onRightPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}