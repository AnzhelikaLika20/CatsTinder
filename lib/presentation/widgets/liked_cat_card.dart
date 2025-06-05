import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entity/liked_cat.dart';

class LikedCatCard extends StatelessWidget {
  final LikedCat likedCat;
  final VoidCallback onDelete;

  const LikedCatCard({
    super.key,
    required this.likedCat,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
      shadowColor: const Color(0xFFF8BBD0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: likedCat.cat.imageUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            placeholder:
                (context, url) => const SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            errorWidget:
                (context, url, error) => const Icon(
                  Icons.broken_image,
                  size: 56,
                  color: Color(0xFFF06292),
                ),
          ),
        ),
        title: Text(
          likedCat.cat.breed,
          style: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 18,
            color: Color(0xFFF06292),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Лайк: ${likedCat.likedAt}',
          style: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 14,
            color: Color(0xFF757575),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Color(0xFFF8BBD0)),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
