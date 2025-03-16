import 'package:flutter/material.dart';
import '../models/cat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/detail_screen.dart';

class CatImage extends StatelessWidget {
  final bool isLoading;
  final Cat? cat;
  final Function(DismissDirection) onDismissed;

  const CatImage({
    super.key,
    required this.isLoading,
    required this.cat,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenHeight * 0.15,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child:
            isLoading
                ? const CircularProgressIndicator()
                : Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: onDismissed,
                  child: GestureDetector(
                    onTap: () {
                      if (cat != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(cat: cat!),
                          ),
                        );
                      }
                    },
                    child: CachedNetworkImage(
                      imageUrl: cat!.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
      ),
    );
  }
}
