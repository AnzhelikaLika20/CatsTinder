import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'CatsTinder',
        style: TextStyle(
          fontFamily: 'CustomFont',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
