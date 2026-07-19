import 'package:flutter/material.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
            backgroundColor: Colors.white,
            title: const Text("Programing E-Learning",),
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
