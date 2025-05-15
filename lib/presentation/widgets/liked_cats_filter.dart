import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/liked_cats_cubit.dart';

class LikedCatsFilter extends StatelessWidget {
  final List<String> breeds;
  final String selected;

  const LikedCatsFilter({super.key, required this.breeds, required this.selected});

  @override
  Widget build(BuildContext context) {
    final availableBreeds = breeds.toSet().toList();
    String currentSelected = selected;

    if (currentSelected.isNotEmpty && !availableBreeds.contains(currentSelected)) {
      currentSelected = '';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<LikedCatsCubit>().setBreedFilter('');
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: currentSelected,
        hint: Text('Фильтр по породе'),
        items: [
          DropdownMenuItem(value: '', child: Text('Все породы')),
          ...availableBreeds.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
        ],
        onChanged: (breed) =>
            context.read<LikedCatsCubit>().setBreedFilter(breed ?? ''),
      ),
    );
  }
}
