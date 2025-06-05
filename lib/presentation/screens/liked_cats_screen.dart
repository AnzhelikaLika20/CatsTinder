import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../cubit/liked_cats_cubit.dart';
import '../widgets/app_bar.dart';
import '../widgets/liked_cat_card.dart';
import '../widgets/liked_cats_filter.dart';
import '../widgets/connectivity_listener.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<LikedCatsCubit>(),
      child: ConnectivityListener(
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Любимчики'),
          backgroundColor: Colors.white,
          body: BlocBuilder<LikedCatsCubit, LikedCatsState>(
            builder: (context, state) {
              final breeds =
              state.likedCats.map((e) => e.cat.breed).toSet().toList();
              return Column(
                children: [
                  LikedCatsFilter(
                    breeds: breeds,
                    selected: state.breedFilter ?? '',
                  ),
                  Expanded(
                    child: state.filteredCats.isEmpty
                        ? const Center(
                      child: Text(
                        'Нет лайкнутых котиков',
                        style: TextStyle(
                          fontFamily: 'CustomFont',
                          fontSize: 20,
                          color: Color(0xFF757575),
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: state.filteredCats.length,
                      itemBuilder: (context, i) {
                        final liked = state.filteredCats[i];
                        return LikedCatCard(
                          likedCat: liked,
                          onDelete: () => context
                              .read<LikedCatsCubit>()
                              .removeCat(liked),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
