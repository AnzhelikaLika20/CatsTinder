import 'package:flutter/material.dart';
import '../../domain/entity/cat.dart';

class BreedText extends StatelessWidget {
  final Cat? cat;

  const BreedText({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        cat != null ? cat!.breed : 'Загрузка...',
        style: const TextStyle(
          fontFamily: 'CustomFont',
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: Color(0xFFFF69B4),
          letterSpacing: 1.2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
