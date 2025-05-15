import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../cubit/liked_cats_cubit.dart';
import '../screens/liked_cats_screen.dart';

class FavoriteCounterButton extends StatelessWidget {
  const FavoriteCounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedCatsCubit, LikedCatsState>(
      bloc: GetIt.I<LikedCatsCubit>(),
      builder: (context, state) {
        final likedCount = state.likedCats.length;
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFF8BBD0),
            textStyle: const TextStyle(
              fontFamily: 'CustomFont',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            shadowColor: const Color(0xFFF8BBD0),
            elevation: 3,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          ),
          icon: const Icon(Icons.favorite, color: Color(0xFFFF69B4), size: 28),
          label: Text('Любимчики ($likedCount)'),
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const LikedCatsScreen()));
          },
        );
      },
    );
  }
}
