import 'package:e_learning/provider/LessonProvider.dart';
import 'package:e_learning/screens/LessonVideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LessonDetailScreen extends ConsumerStatefulWidget {
  final String id;

  const LessonDetailScreen({super.key, required this.id});

  @override
  ConsumerState<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends ConsumerState<LessonDetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(lessonDetailProvider.notifier).loadDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lessonDetailProvider);

    if (state.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (state.error != null) {
      return Scaffold(
        appBar: AppBar(),

        body: Center(child: Text(state.error!)),
      );
    }

    final lesson = state.lesson;

    if (lesson == null) {
      return const Scaffold(body: Center(child: Text("Lesson not found")));
    }

    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Video Area
            Container(
              height: 220,

              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.black,

                borderRadius: BorderRadius.circular(12),
              ),

              child:  Center(
                child: InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonYoutubePlayer(url:lesson.videoUrl.toString()))),

                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              lesson.title,

              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.timer_outlined, size: 18),

                const SizedBox(width: 5),

                Text("${lesson.duration ?? 0} minutes"),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Description",

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              lesson.description ?? "No description",

              style: const TextStyle(
                fontSize: 14,

                height: 1.5,

                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  // open video player here
                },

                child: const Text("Start Lesson"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
