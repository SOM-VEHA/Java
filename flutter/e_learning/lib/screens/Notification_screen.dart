import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Colors.white,
            title: const Text("Notifications"),
            centerTitle: false,
            elevation: 0,
            pinned: true,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
        ],
      ),
    );
  }
}
