import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/cat_service.dart';
import '../widgets/like_button.dart';
import 'detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CatsTinder',
          style: TextStyle(
            fontFamily: 'TitleFont',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.red
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Breed: ${_cat != null ? _cat!.breed : 'Loading...'}',
                style: TextStyle(
                  fontFamily: 'TitleFont',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.horizontal,
                      onDismissed: _handleSwipe,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(cat: _cat!),
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl: _cat!.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
            ),
          ),
          Positioned(
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
                          child: Image.asset('assets/like.png'),
                        ),
                        iconSize: 60,
                        onPressed: () {
                          _incrementLikes();
                          _fetchCat();
                        },
                      ),
                      SizedBox(width: 60),
                      IconButton(
                        icon: SizedBox(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/dislike.png'),
                        ),
                        iconSize: 60,
                        onPressed: _fetchCat,
                      ),
                    ],
                  ),
                  Text(
                    'Likes: $_likeCounter',
                    style: TextStyle(
                      fontFamily: 'TitleFont',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
