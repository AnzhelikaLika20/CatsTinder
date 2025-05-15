import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../domain/entity/liked_cat.dart';

class LikedCatCard extends StatelessWidget {
  final LikedCat likedCat;
  final VoidCallback onDelete;

  const LikedCatCard({super.key, required this.likedCat, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: likedCat.cat.imageUrl,
          placeholder: (_, __) => CircularProgressIndicator(),
          width: 60,
          height: 60,
        ),
        title: Text(likedCat.cat.breed),
        subtitle: Text('Лайк: ${likedCat.likedAt}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
