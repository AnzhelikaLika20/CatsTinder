import 'package:flutter/material.dart';
import '../../domain/entity/cat.dart';
import '../widgets/app_bar.dart';
import '../widgets/cat_image.dart';
import '../widgets/breed_text.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;
  const DetailScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
              child: Center(child: CatImage(cat: cat)),
            ),
            Center(child: BreedText(cat: cat)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                cat.description,
                style: const TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 18,
                  color: Color(0xFF444444),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
