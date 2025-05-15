import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, this.title = 'CatsTinder'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFF8BBD0),
            letterSpacing: 1.5,
            shadows: [
              Shadow(color: Colors.white, blurRadius: 4, offset: Offset(0, 2)),
            ],
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Color(0xFFF06292)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
