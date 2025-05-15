import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entity/cat.dart';

class CatImage extends StatelessWidget {
  final Cat cat;
  final bool isLoading;
  final void Function(DismissDirection)? onDismissed;
  final VoidCallback? onTap;

  const CatImage({
    super.key,
    required this.cat,
    this.isLoading = false,
    this.onDismissed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double imgHeight = MediaQuery.of(context).size.height * 0.35;

    Widget content = GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: cat.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: imgHeight,
          placeholder:
              (context, url) =>
                  const Center(child: CircularProgressIndicator()),
          errorWidget:
              (context, url, error) => const Icon(Icons.error, size: 64),
        ),
      ),
    );

    if (onDismissed != null) {
      content = Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        onDismissed: onDismissed!,
        child: content,
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: imgHeight,
      child:
          isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Color(0xFFF8BBD0)),
              )
              : content,
    );
  }
}
