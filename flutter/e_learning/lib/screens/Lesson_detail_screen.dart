import 'package:flutter/material.dart';

class LessonDetail extends StatelessWidget {
  const LessonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios),
            ),
          )
        ],
      ),
    );
  }
}
