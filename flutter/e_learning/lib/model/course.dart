class Course {
  final String id;
  final String title;
  final String instructor;
  final String price;
  final String rating;
  final String image;
  final List<Lesson> lessons;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.price,
    required this.rating,
    required this.image,
    required this.lessons,
  });
}

class Lesson {
  final String title;
  final String duration;
  final bool isCompleted;

  Lesson({
    required this.title,
    required this.duration,
    this.isCompleted = false,
  });
}

final List<Course> courses = [
  Course(
    id: '1',
    title: 'Flutter Mastery: Build Real-World Apps',
    instructor: 'Alex Rivera',
    price: r'$49.99',
    rating: '4.8',
    image: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97',
    lessons: [
      Lesson(title: 'Introduction to Flutter', duration: '10:00'),
      Lesson(title: 'Setting up Development Environment', duration: '15:00'),
      Lesson(title: 'Understanding Widgets', duration: '25:00'),
      Lesson(title: 'State Management basics', duration: '30:00'),
    ],
  ),
  Course(
    id: '2',
    title: 'Python for Data Science and ML',
    instructor: 'Sarah Jenkins',
    price: r'$59.99',
    rating: '4.9',
    image: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5',
    lessons: [
      Lesson(title: 'Python Basics', duration: '20:00'),
      Lesson(title: 'NumPy for Data Analysis', duration: '40:00'),
      Lesson(title: 'Pandas Deep Dive', duration: '50:00'),
    ],
  ),
  Course(
    id: '3',
    title: 'Modern JavaScript from Zero to Hero',
    instructor: 'David Miller',
    price: r'$39.99',
    rating: '4.7',
    image: 'https://images.unsplash.com/photo-1587620962725-abab7fe55159',
    lessons: [
      Lesson(title: 'ES6+ Features', duration: '30:00'),
      Lesson(title: 'Async Programming', duration: '45:00'),
      Lesson(title: 'Building a Web App', duration: '60:00'),
    ],
  ),
];
