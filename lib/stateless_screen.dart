import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  StatelessScreen({super.key});

  int x = 0;

  @override
  Widget build(BuildContext context) {
    print(build);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateLessWidget Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              x.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;
          print(x);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
