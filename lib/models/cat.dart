class Cat {
  final String imageUrl;
  final String breed;
  final String description;

  Cat({required this.imageUrl, required this.breed, required this.description});

  factory Cat.fromJson(Map<String, dynamic> json) {
    String breed = 'Unknown';
    String description = 'No description available';

    if (json['breeds'] != null &&
        json['breeds'] is List &&
        json['breeds'].isNotEmpty) {
      breed = json['breeds'][0]['name'] ?? 'Unknown';
    }
    if (json['breeds'] != null &&
        json['breeds'] is List &&
        json['breeds'].isNotEmpty) {
      description =
          json['breeds'][0]['description'] ?? 'No description available';
    }

    return Cat(imageUrl: json['url'], breed: breed, description: description);
  }
}
