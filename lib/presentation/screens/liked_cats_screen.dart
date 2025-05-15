import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../widgets/liked_cat_card.dart';
import '../widgets/liked_cats_filter.dart';
import '../cubit/liked_cats_cubit.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<LikedCatsCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text('Liked Cats')),
        body: BlocBuilder<LikedCatsCubit, LikedCatsState>(
          builder: (context, state) {
            final breeds = state.likedCats.map((e) => e.cat.breed).toSet().toList();
            return Column(
              children: [
                LikedCatsFilter(
                  breeds: breeds,
                  selected: state.breedFilter ?? '',
                ),
                Expanded(
                  child: state.filteredCats.isEmpty
                      ? Center(child: Text('Нет лайкнутых котиков'))
                      : ListView.builder(
                    itemCount: state.filteredCats.length,
                    itemBuilder: (context, i) {
                      final liked = state.filteredCats[i];
                      return LikedCatCard(
                        likedCat: liked,
                        onDelete: () => context.read<LikedCatsCubit>().removeCat(liked),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
