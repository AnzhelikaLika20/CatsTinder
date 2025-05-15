class Cat {
  final String id;
  final String imageUrl;
  final String breed;
  final String description;

  Cat({
    required this.id,
    required this.imageUrl,
    required this.breed,
    required this.description,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    final breeds = json['breeds'] as List?;
    final breedData = (breeds != null && breeds.isNotEmpty) ? breeds[0] : null;
    return Cat(
      id: json['id'] ?? '',
      imageUrl: json['url'] ?? '',
      breed: breedData?['name'] ?? '',
      description: breedData?['description'] ?? '',
    );
  }
}