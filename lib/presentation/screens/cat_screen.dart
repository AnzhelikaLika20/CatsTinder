import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entity/cat.dart';
import '../../services/cat_service.dart';
import '../widgets/app_bar.dart';
import '../widgets/breed_text.dart';
import '../widgets/cat_image.dart';
import '../widgets/action_buttons.dart';
import '../widgets/favorite_counter_button.dart';
import '../cubit/liked_cats_cubit.dart';
import 'detail_screen.dart';

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
      _cat = null;
    });

    try {
      final cat = await CatService().fetchRandomCat();
      setState(() {
        _cat = cat;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Ошибка сети'),
              content: Text(
                'Не удалось загрузить котика. Проверьте соединение с интернетом.\n$e',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
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

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 26),
            BreedText(cat: _cat),
            const SizedBox(height: 8),
            Center(
              child: SizedBox(
                width: imgWidth,
                height: imgHeight,
                child:
                    _cat != null
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
            const SizedBox(height: 18),
            const FavoriteCounterButton(),
            const SizedBox(height: 10),
            const Expanded(child: SizedBox.shrink()),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
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
    );
  }
}
