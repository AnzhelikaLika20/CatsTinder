import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/cat_service.dart';
import '../widgets/app_bar.dart';
import '../widgets/breed_text.dart';
import '../widgets/cat_image.dart';
import '../widgets/action_buttons.dart';

class CatScreen extends StatefulWidget {
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
      _cat = null;
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
    await _fetchCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BreedText(cat: _cat),
          CatImage(
            isLoading: _isLoading,
            cat: _cat,
            onDismissed: _handleSwipe,
          ),
          ActionButtons(
            likeCounter: _likeCounter,
            onLike: () {
              _incrementLikes();
              _fetchCat();
            },
            onDislike: _fetchCat,
          ),
        ],
      ),
    );
  }
}
