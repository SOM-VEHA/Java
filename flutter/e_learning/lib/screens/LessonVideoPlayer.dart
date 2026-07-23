import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LessonYoutubePlayer extends StatefulWidget {
  final String url;

  const LessonYoutubePlayer({
    super.key,
    required this.url,
  });

  @override
  State<LessonYoutubePlayer> createState() => _LessonYoutubePlayerState();
}

class _LessonYoutubePlayerState extends State<LessonYoutubePlayer> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayerController.convertUrlToId(widget.url)!;

    controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: controller,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }
}