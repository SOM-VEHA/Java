// import 'package:flutter/material.dart';
//
// class YoutubePlayerUI extends StatelessWidget {
//   const YoutubePlayerUI({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//
//             // Video Player
//             AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Image.network(
//                     "https://i.ytimg.com/vi/dQw4w9WgXcQ/maxresdefault.jpg",
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//
//                   Container(
//                     color: Colors.black26,
//                   ),
//
//                   CircleAvatar(
//                     radius: 35,
//                     backgroundColor: Colors.red,
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 40,
//                     ),
//                   ),
//
//                   Positioned(
//                     bottom: 12,
//                     left: 12,
//                     right: 12,
//                     child: Column(
//                       children: [
//
//                         LinearProgressIndicator(
//                           value: 0.35,
//                           color: Colors.red,
//                           backgroundColor: Colors.white30,
//                         ),
//
//                         const SizedBox(height: 8),
//
//                         Row(
//                           children: const [
//
//                             Text(
//                               "05:21",
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//
//                             Spacer(),
//
//                             Icon(
//                               Icons.settings,
//                               color: Colors.white,
//                             ),
//
//                             SizedBox(width: 15),
//
//                             Icon(
//                               Icons.fullscreen,
//                               color: Colors.white,
//                             ),
//                           ],
//                         )
//
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//             // Title
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   const Text(
//                     "Flutter Complete Course for Beginners",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//
//                   const SizedBox(height: 6),
//
//                   Text(
//                     "1.2M views • 2 days ago",
//                     style: TextStyle(
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Actions
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: const [
//
//                   _ActionButton(
//                     icon: Icons.thumb_up_alt_outlined,
//                     text: "Like",
//                   ),
//
//                   _ActionButton(
//                     icon: Icons.thumb_down_alt_outlined,
//                     text: "Dislike",
//                   ),
//
//                   _ActionButton(
//                     icon: Icons.share_outlined,
//                     text: "Share",
//                   ),
//
//                   _ActionButton(
//                     icon: Icons.download_outlined,
//                     text: "Download",
//                   ),
//
//                   _ActionButton(
//                     icon: Icons.bookmark_border,
//                     text: "Save",
//                   ),
//
//                 ],
//               ),
//             ),
//
//             const Divider(),
//
//             // Channel
//             ListTile(
//               leading: const CircleAvatar(
//                 radius: 24,
//                 backgroundImage: NetworkImage(
//                   "https://i.pravatar.cc/150",
//                 ),
//               ),
//               title: const Text(
//                 "Empire KH",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: const Text("245K subscribers"),
//               trailing: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   "Subscribe",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//
//             const Divider(),
//
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.network(
//                         "https://picsum.photos/150/90?random=$index",
//                         width: 120,
//                         height: 70,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     title: Text(
//                       "Flutter Tutorial Part ${index + 1}",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     subtitle: const Text(
//                       "Empire KH • 20K views",
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _ActionButton extends StatelessWidget {
//   final IconData icon;
//   final String text;
//
//   const _ActionButton({
//     required this.icon,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Icon(icon),
//         const SizedBox(height: 4),
//         Text(
//           text,
//           style: const TextStyle(fontSize: 12),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({super.key});

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController.fromVideoId(
      videoId: 'vhfeGg7ylFQ', // test video
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter YouTube Player"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}