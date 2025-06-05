import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entity/cat.dart';
import '../../data/cat_repository_impl.dart';
import '../cubit/liked_cats_cubit.dart';
import '../widgets/action_buttons.dart';
import '../widgets/app_bar.dart';
import '../widgets/breed_text.dart';
import '../widgets/cat_image.dart';
import '../widgets/favorite_counter_button.dart';
import '../screens/detail_screen.dart';
import '../widgets/connectivity_listener.dart';

class CatScreen extends StatefulWidget {
  const CatScreen({super.key});

  @override
  State<CatScreen> createState() => _CatScreenState();
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
    });

    try {
      final cat = await GetIt.I<CatRepositoryImpl>().fetchRandomCat();
      if (!mounted) return;

      setState(() {
        _cat = cat;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Нет сети. Показан последний загруженный котик'),
        ),
      );
    }
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
    final double imgHeight = MediaQuery.of(context).size.height * 0.35;
    final double imgWidth = MediaQuery.of(context).size.width * 0.8;

    return ConnectivityListener(
      child: Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 26),
              BreedText(cat: _cat),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: imgWidth,
                  height: imgHeight,
                  child: _cat != null
                      ? CatImage(
                    cat: _cat!,
                    isLoading: _isLoading,
                    onDismissed: _handleSwipe,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(cat: _cat!),
                        ),
                      );
                    },
                  )
                      : const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFF8BBD0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const FavoriteCounterButton(),
              const SizedBox(height: 10),
              const Expanded(child: SizedBox.shrink()),
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: ActionButtons(
                  onLike: () {
                    if (_cat != null) {
                      _likeAndSaveCat();
                      _fetchCat();
                    }
                  },
                  onDislike: _fetchCat,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
