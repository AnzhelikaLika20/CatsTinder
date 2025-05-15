import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/liked_cats_cubit.dart';

class LikedCatsFilter extends StatelessWidget {
  final List<String> breeds;
  final String selected;

  const LikedCatsFilter({
    super.key,
    required this.breeds,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final availableBreeds = breeds.toSet().toList();
    String currentSelected = selected;

    if (currentSelected.isNotEmpty &&
        !availableBreeds.contains(currentSelected)) {
      currentSelected = '';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<LikedCatsCubit>().setBreedFilter('');
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 12,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentSelected,
              hint: const Text(
                'Фильтр по породе',
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 18,
                  color: Color(0xFFB388FF),
                  fontWeight: FontWeight.w500,
                ),
              ),
              items: [
                const DropdownMenuItem(
                  value: '',
                  child: Text(
                    'Все породы',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      fontSize: 18,
                      color: Color(0xFF757575),
                    ),
                  ),
                ),
                ...availableBreeds.map(
                  (b) => DropdownMenuItem(
                    value: b,
                    child: Text(
                      b,
                      style: const TextStyle(
                        fontFamily: 'CustomFont',
                        fontSize: 18,
                        color: Color(0xFF757575),
                      ),
                    ),
                  ),
                ),
              ],
              borderRadius: BorderRadius.circular(18),
              dropdownColor: Colors.white,
              onChanged:
                  (breed) => context.read<LikedCatsCubit>().setBreedFilter(
                    breed ?? '',
                  ),
              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFF06292)),
            ),
          ),
        ),
      ),
    );
  }
}
