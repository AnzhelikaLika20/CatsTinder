import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import '../cubit/liked_cats_cubit.dart';

class LikedCatsScreen extends StatelessWidget {
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: state.breedFilter ?? '',
                      hint: Text('Фильтр по породе'),
                      items: [
                        DropdownMenuItem(value: '', child: Text('Все породы')),
                        ...breeds.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                      ],
                      onChanged: (breed) => context.read<LikedCatsCubit>().setBreedFilter(breed ?? ''),
                    ),
                  ),
                  state.filteredCats.isEmpty
                      ? Expanded(child: Center(child: Text('Нет лайкнутых котиков')))
                      : Expanded(
                    child: ListView.builder(
                      itemCount: state.filteredCats.length,
                      itemBuilder: (context, i) {
                        final liked = state.filteredCats[i];
                        return Card(
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: liked.cat.imageUrl,
                              placeholder: (_, __) => CircularProgressIndicator(),
                              width: 60, height: 60,
                            ),
                            title: Text(liked.cat.breed),
                            subtitle: Text('Лайк: ${liked.likedAt}'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => context.read<LikedCatsCubit>().removeCat(liked),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
