import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const ActionButtons({
    super.key,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset('assets/dislike.png'),
                ),
                onPressed: onDislike,
              ),
              const SizedBox(width: 60),
              IconButton(
                icon: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset('assets/like.png'),
                ),
                onPressed: onLike,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
