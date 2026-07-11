// import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';
//
// import '../model/Achievement.dart';
// import '../model/UserProfile.dart';
//
// class ProfileScreen extends StatefulWidget {
//   final UserProfile profile;
//
//   final bool isDarkMode;
//
//   final VoidCallback onToggleDarkMode;
//
//   final VoidCallback onLogout;
//
//   final bool isNotifications;
//
//   final VoidCallback onToggleNotifications;
//
//   const ProfileScreen({
//     super.key,
//
//     required this.profile,
//
//     required this.isDarkMode,
//
//     required this.onToggleDarkMode,
//
//     required this.onLogout,
//
//     required this.isNotifications,
//
//     required this.onToggleNotifications,
//   });
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   Achievement? selectedAchievement;
//
//   IconData achievementIcon(String name) {
//     switch (name) {
//       case "Flame":
//         return LucideIcons.flame;
//
//       case "Award":
//         return LucideIcons.award;
//
//       case "Zap":
//         return LucideIcons.zap;
//
//       case "Compass":
//         return LucideIcons.compass;
//
//       case "Tv":
//         return LucideIcons.tv;
//
//       default:
//         return LucideIcons.award;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = widget.isDarkMode;
//
//     final achievements = widget.profile.stats.achievements;
//
//     final unlocked = achievements.where((a) => a.unlocked).length;
//
//     return Scaffold(
//       backgroundColor: dark ? Colors.black : const Color(0xffF8FAFC),
//
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.only(bottom: 100),
//
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//             children: [
//               // HEADER
//               const SizedBox(height: 30),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                   children: [
//                     const Text(
//                       "USER PORTAL",
//
//                       style: TextStyle(
//                         fontSize: 10,
//
//                         letterSpacing: 1,
//
//                         color: Colors.grey,
//                       ),
//                     ),
//
//                     Text(
//                       "My Profile",
//
//                       style: TextStyle(
//                         fontSize: 22,
//
//                         fontWeight: FontWeight.bold,
//
//                         color: dark ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // PROFILE CARD
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//
//                   decoration: BoxDecoration(
//                     color: dark ? Colors.grey[900] : Colors.white,
//
//                     borderRadius: BorderRadius.circular(25),
//
//                     border: Border.all(color: Colors.grey.shade200),
//                   ),
//
//                   child: Row(
//                     children: [
//                       Stack(
//                         children: [
//                           CircleAvatar(
//                             radius: 32,
//
//                             backgroundImage: NetworkImage(
//                               widget.profile.avatar,
//                             ),
//                           ),
//
//                           Positioned(
//                             right: 0,
//
//                             bottom: 5,
//
//                             child: Container(
//                               width: 12,
//
//                               height: 12,
//
//                               decoration: const BoxDecoration(
//                                 color: Colors.green,
//
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const SizedBox(width: 15),
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//
//                         children: [
//                           Text(
//                             widget.profile.name,
//
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//
//                           Text(
//                             widget.profile.email,
//
//                             style: const TextStyle(
//                               fontSize: 11,
//
//                               color: Colors.grey,
//                             ),
//                           ),
//
//                           const SizedBox(height: 8),
//
//                           Row(
//                             children: [
//                               badge("PRO LEARNER", Colors.blue),
//
//                               const SizedBox(width: 5),
//
//                               badge("🔥 Lvl 14", Colors.orange),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               // ACHIEVEMENTS
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                   children: [
//                     const Text(
//                       "Unlocked Achievements",
//
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//
//                     Text(
//                       "$unlocked / ${achievements.length} unlocked",
//
//                       style: const TextStyle(fontSize: 11, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               SizedBox(
//                 height: 120,
//
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//
//                   itemCount: achievements.length,
//
//                   itemBuilder: (context, index) {
//                     final ach = achievements[index];
//
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedAchievement = ach;
//                         });
//                       },
//
//                       child: Container(
//                         width: 95,
//
//                         margin: const EdgeInsets.only(right: 12),
//
//                         padding: const EdgeInsets.all(12),
//
//                         decoration: BoxDecoration(
//                           color: dark ? Colors.grey[900] : Colors.white,
//
//                           borderRadius: BorderRadius.circular(18),
//
//                           border: Border.all(color: Colors.grey.shade200),
//                         ),
//
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 18,
//
//                               backgroundColor: Colors.grey[100],
//
//                               child: Icon(
//                                 ach.unlocked
//                                     ? achievementIcon(ach.icon)
//                                     : LucideIcons.lock,
//
//                                 size: 18,
//
//                                 color: ach.unlocked
//                                     ? Colors.purple
//                                     : Colors.grey,
//                               ),
//                             ),
//
//                             const SizedBox(height: 8),
//
//                             Text(
//                               ach.title,
//
//                               maxLines: 1,
//
//                               overflow: TextOverflow.ellipsis,
//
//                               style: const TextStyle(
//                                 fontSize: 10,
//
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//
//                             Text(
//                               ach.unlocked ? "Unlocked" : "Locked",
//
//                               style: const TextStyle(
//                                 fontSize: 9,
//
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               // SETTINGS
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//
//                 child: const Text(
//                   "Preferences & Settings",
//
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//               const SizedBox(height: 12),
//
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//
//                 decoration: BoxDecoration(
//                   color: dark ? Colors.grey[900] : Colors.white,
//
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//
//                 child: Column(
//                   children: [
//                     SettingTile(
//                       icon: widget.isDarkMode
//                           ? LucideIcons.moon
//                           : LucideIcons.sun,
//
//                       title: "Dark UI Environment",
//
//                       sub: "Saves battery life and eye fatigue",
//
//                       switchValue: widget.isDarkMode,
//
//                       onTap: widget.onToggleDarkMode,
//                     ),
//
//                     SettingTile(
//                       icon: LucideIcons.bell,
//
//                       title: "Push Notifications",
//
//                       sub: "Daily goal and streak alerts",
//
//                       switchValue: widget.isNotifications,
//
//                       onTap: widget.onToggleNotifications,
//                     ),
//
//                     SettingTile(
//                       icon: LucideIcons.shield,
//
//                       title: "Account & Credentials",
//
//                       sub: "Manage private encryption keys",
//                     ),
//
//                     SettingTile(
//                       icon: LucideIcons.helpCircle,
//
//                       title: "Help Center",
//
//                       sub: "Syllabus support and feedback",
//                     ),
//
//                     SettingTile(
//                       icon: LucideIcons.logOut,
//
//                       title: "Sign Out",
//
//                       sub: "Clear security credentials",
//
//                       danger: true,
//
//                       onTap: widget.onLogout,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget badge(String text, Color color) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//
//       decoration: BoxDecoration(
//         color: color.withOpacity(.15),
//
//         borderRadius: BorderRadius.circular(5),
//       ),
//
//       child: Text(
//         text,
//
//         style: TextStyle(
//           fontSize: 8,
//
//           fontWeight: FontWeight.bold,
//
//           color: color,
//         ),
//       ),
//     );
//   }
// }
//
//
// class SettingTile extends StatelessWidget {
//
//
//   final IconData icon;
//
//   final String title;
//
//   final String sub;
//
//   final bool switchValue;
//
//   final bool danger;
//
//   final VoidCallback? onTap;
//
//
//
//   const SettingTile({
//
//     super.key,
//
//     required this.icon,
//
//     required this.title,
//
//     required this.sub,
//
//     this.switchValue=false,
//
//     this.danger=false,
//
//     this.onTap,
//
//   });
//
//
//
//   @override
//   Widget build(BuildContext context){
//
//
//     return ListTile(
//
//       onTap:onTap,
//
//
//       leading:
//
//       CircleAvatar(
//
//         backgroundColor:
//         danger
//             ?Colors.red.withOpacity(.1)
//             :Colors.blue.withOpacity(.1),
//
//
//         child:
//
//         Icon(
//
//           icon,
//
//           size:18,
//
//           color:
//           danger
//               ?Colors.red
//               :Colors.blue,
//
//         ),
//
//       ),
//
//
//       title:
//
//       Text(
//
//         title,
//
//         style:
//         const TextStyle(
//
//             fontSize:13,
//
//             fontWeight:
//             FontWeight.w600
//
//         ),
//
//       ),
//
//
//
//       subtitle:
//
//       Text(
//
//         sub,
//
//         style:
//         const TextStyle(
//
//             fontSize:10,
//
//             color:Colors.grey
//
//         ),
//
//       ),
//
//
//
//       trailing:
//
//       onTap!=null
//
//           ?
//
//       Switch(
//
//         value:switchValue,
//
//         onChanged:(v){
//
//           onTap!();
//
//         },
//
//       )
//
//           :null,
//
//
//     );
//
//
//   }
//
// }