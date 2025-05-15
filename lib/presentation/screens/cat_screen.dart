import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/cat.dart';
import '../../services/cat_service.dart';
import '../widgets/app_bar.dart';
import '../widgets/breed_text.dart';
import '../widgets/cat_image.dart';
import '../widgets/action_buttons.dart';
import '../cubit/liked_cats_cubit.dart';
import 'liked_cats_screen.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  Cat? _cat;
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

  void _likeAndSaveCat() {
    if (_cat != null) {
      GetIt.I<LikedCatsCubit>().addCat(_cat!);
    }
  }

  void _handleSwipe(DismissDirection direction) async {
    if (direction == DismissDirection.startToEnd) {
      _likeAndSaveCat();
    }
    await _fetchCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BreedText(cat: _cat),
          CatImage(isLoading: _isLoading, cat: _cat, onDismissed: _handleSwipe),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocBuilder<LikedCatsCubit, LikedCatsState>(
                      bloc: GetIt.I<LikedCatsCubit>(),
                      builder: (context, state) {
                        final likedCount = state.likedCats.length;
                        return ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const LikedCatsScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.favorite),
                          label: Text('Любимчики ($likedCount)'),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ActionButtons(
                      onLike: () {
                        _likeAndSaveCat();
                        _fetchCat();
                      },
                      onDislike: _fetchCat,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
