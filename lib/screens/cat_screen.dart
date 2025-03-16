import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/cat_service.dart';
import '../widgets/like_button.dart';
import 'detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  Cat? _cat;
  int _likeCounter = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCat();
  }

  Future<void> _fetchCat() async {
    setState(() {
      _isLoading = true;
      _cat = null; // Для активации индикации загрузки в интерфейсе
    });

    final cat = await CatService().fetchRandomCat();
    setState(() {
      _cat = cat;
      _isLoading = false;
    });
  }

  void _incrementLikes() {
    setState(() {
      _likeCounter++;
    });
  }

  void _handleSwipe(DismissDirection direction) async {
    if (direction == DismissDirection.endToStart) {
      _incrementLikes();
    }
    await _fetchCat(); // Загружаем нового котика
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Cat'),
      ),
      body: _cat == null || _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                _handleSwipe(direction);
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(cat: _cat!),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: _cat!.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Text('Breed: ${_cat!.breed}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LikeButton(
                          icon: Icons.thumb_up,
                          onPressed: () {
                            _incrementLikes();
                            _fetchCat();
                          },
                        ),
                        LikeButton(
                          icon: Icons.thumb_down,
                          onPressed: _fetchCat,
                        ),
                      ],
                    ),
                    Text('Likes: $_likeCounter'),
                  ],
                ),
              ),
            ),
    );
  }
}
