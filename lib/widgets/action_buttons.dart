import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final int likeCounter;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  ActionButtons({
    required this.likeCounter,
    required this.onLike,
    required this.onDislike,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenHeight * 0.75,
      left: 0,
      right: 0,
      child: Container(
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
                SizedBox(width: 60),
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
            Text(
              'Likes: $likeCounter',
              style: TextStyle(
                fontFamily: 'CustomFont',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
