class Course {
  final String id;
  final String title;
  final String instructor;
  final String price;
  final String rating;
  final String image;
  final String category;
  final List<Lesson> lessons;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.price,
    required this.rating,
    required this.image,
    required this.category,
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
    category: 'Flutter',
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
    title: 'Java Deep Dive: From Syntax to Spring',
    instructor: 'James Gosling',
    price: r'$54.99',
    rating: '4.9',
    category: 'Java',
    image: 'https://images.unsplash.com/photo-1511376777868-611b54f68947',
    lessons: [
      Lesson(title: 'Java Syntax & Basics', duration: '20:00'),
      Lesson(title: 'Object Oriented Programming', duration: '45:00'),
      Lesson(title: 'Collections Framework', duration: '35:00'),
    ],
  ),
  Course(
    id: '3',
    title: 'C# Masterclass for Game Dev',
    instructor: 'Sarah Jenkins',
    price: r'$59.99',
    rating: '4.9',
    category: 'C#',
    image: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b',
    lessons: [
      Lesson(title: 'C# Basics for Unity', duration: '20:00'),
      Lesson(title: 'Scripting Fundamentals', duration: '40:00'),
      Lesson(title: 'Advanced Game Logic', duration: '50:00'),
    ],
  ),
  Course(
    id: '4',
    title: 'Modern JavaScript from Zero to Hero',
    instructor: 'David Miller',
    price: r'$39.99',
    rating: '4.7',
    category: 'Dart', // Reusing Dart as a placeholder or could add JavaScript category
    image: 'https://images.unsplash.com/photo-1587620962725-abab7fe55159',
    lessons: [
      Lesson(title: 'ES6+ Features', duration: '30:00'),
      Lesson(title: 'Async Programming', duration: '45:00'),
      Lesson(title: 'Building a Web App', duration: '60:00'),
    ],
  ),
  Course(
    id: '5',
    title: 'PHP & MySQL: Build a CMS',
    instructor: 'Mark Wilson',
    price: r'$44.99',
    rating: '4.6',
    category: 'PHP',
    image: 'https://images.unsplash.com/photo-1599507593499-a3f7d7d97667',
    lessons: [
      Lesson(title: 'PHP Environment Setup', duration: '15:00'),
      Lesson(title: 'Database Design', duration: '30:00'),
      Lesson(title: 'CRUD Operations', duration: '45:00'),
    ],
  ),
  Course(
    id: '6',
    title: 'HTML5 & CSS3: The Complete Guide',
    instructor: 'Emma Thompson',
    price: r'$29.99',
    rating: '4.5',
    category: 'HTML',
    image: 'https://images.unsplash.com/photo-1542831371-29b0f74f9713',
    lessons: [
      Lesson(title: 'HTML Tags & Structure', duration: '25:00'),
      Lesson(title: 'CSS Box Model', duration: '35:00'),
      Lesson(title: 'Responsive Design', duration: '40:00'),
    ],
  ),
];
