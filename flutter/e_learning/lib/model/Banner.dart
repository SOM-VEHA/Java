class Banner{
  final String id;
  final String title;
  final String description;
  final String image;
  Banner({required this.id, required this.title, required this.description, required this.image});
  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}