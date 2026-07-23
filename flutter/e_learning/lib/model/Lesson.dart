
class Lesson {
  final String id;
  final String courseId;
  final String title;
  final String? description;
  final String? videoUrl;
  final double? duration;
  final int lessonOrder;
  final bool isPreview;
  final DateTime createdAt;
  Lesson({
    required this.id,
    required this.courseId,
    required this.title,
    this.description,
    this.videoUrl,
    this.duration,
    required this.lessonOrder,
    required this.isPreview,
    required this.createdAt,
  });
  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      videoUrl: json['video_url'] as String?,
      duration: json['duration'] != null ? (json['duration'] as num).toDouble() : null,
      lessonOrder: json['lesson_order'] as int,
      isPreview: json['is_preview'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'title': title,
      'description': description,
      'video_url': videoUrl,
      'duration': duration,
      'lesson_order': lessonOrder,
      'is_preview': isPreview,
      'created_at': createdAt.toIso8601String(),
    };
  }
  Lesson copyWith({
    String? id,
    String? courseId,
    String? title,
    String? description,
    String? videoUrl,
    double? duration,
    int? lessonOrder,
    bool? isPreview,
    DateTime? createdAt,
  }) {
    return Lesson(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
      lessonOrder: lessonOrder ?? this.lessonOrder,
      isPreview: isPreview ?? this.isPreview,
      createdAt: createdAt ?? this.createdAt,
    );
  }
  @override
  String toString() {
    return 'Lesson(id: $id, title: $title)';
  }
}