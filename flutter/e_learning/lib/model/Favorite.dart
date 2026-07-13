import '../model/Course.dart';
class Favorite{
  final String id;
  final String user_id;
  final String course_id;
  final Course course;
  Favorite({required this.id,required this.user_id,required this.course_id,required this.course});
  factory Favorite.fromJson(Map<String,dynamic>json)=>Favorite(
    id: json["id"],
    user_id: json["user_id"],
    course_id: json["course_id"],
    course: Course.fromJson(json["course"]),
  );
}