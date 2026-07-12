class Course {
  final String id;
  final String title;
  final String description;
  final String instructor;
  final String price;
  final String rating;
  final String image_url;
  final String video_url;
  final String category_id;
  final String duration;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.price,
    required this.rating,
    required this.image_url,
    required this.video_url,
    required this.category_id,
    required this.duration,
  });
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      instructor: json['instructor'].toString(),
      price: json['price'].toString(),
      rating: json['rating'].toString(),
      image_url: json['image_url'].toString(),
      video_url: json['video_url'].toString(),
      category_id: json['category_id'].toString(),
      duration: json['duration'].toString(),
    );
  }
}
