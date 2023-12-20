import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountExample Provider'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
        print('only this widget build');
        return Text(
          value.count.toString(),
          style: const TextStyle(fontSize: 40),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
