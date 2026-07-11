// import 'Achievement.dart';
// import 'achievement.dart';
//
// class UserProfile {
//   final String id;
//
//   final String name;
//
//   final String email;
//
//   final String avatar;
//
//   final UserStats stats;
//
//   UserProfile({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.avatar,
//     required this.stats,
//   });
//
//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//       id: json['id'] ?? '',
//
//       name: json['name'] ?? '',
//
//       email: json['email'] ?? '',
//
//       avatar: json['avatar'] ?? '',
//
//       stats: UserStats.fromJson(json['stats'] ?? {}),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//
//       "name": name,
//
//       "email": email,
//
//       "avatar": avatar,
//
//       "stats": stats.toJson(),
//     };
//   }
// }
//
// class UserStats {
//   final int coursesCompleted;
//
//   final int hoursLearned;
//
//   final int streak;
//
//   final List<Achievement> achievements;
//
//   UserStats({
//     required this.coursesCompleted,
//
//     required this.hoursLearned,
//
//     required this.streak,
//
//     required this.achievements,
//   });
//
//   factory UserStats.fromJson(Map<String, dynamic> json) {
//     return UserStats(
//       coursesCompleted: json['coursesCompleted'] ?? 0,
//
//       hoursLearned: json['hoursLearned'] ?? 0,
//
//       streak: json['streak'] ?? 0,
//
//       achievements: (json['achievements'] as List? ?? [])
//           .map((e) => Achievement.fromJson(e))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "coursesCompleted": coursesCompleted,
//
//       "hoursLearned": hoursLearned,
//
//       "streak": streak,
//
//       "achievements": achievements.map((e) => e.toJson()).toList(),
//     };
//   }
// }
