import 'package:flutter/material.dart';
import '../models/cat.dart';

class BreedText extends StatelessWidget {
  final Cat? cat;

  const BreedText({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'Breed: ${cat != null ? cat!.breed : 'Loading...'}',
          style: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
