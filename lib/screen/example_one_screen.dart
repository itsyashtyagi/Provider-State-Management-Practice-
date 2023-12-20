import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
              builder: (context, providerValue, child) {
            print('hii');
            return Slider(
                min: 0,
                max: 1,
                value: providerValue.value,
                onChanged: (val) {
                  providerValue.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(
            builder: (context, providerValue, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(providerValue.value),
                      ),
                      child: const Center(child: Text('Conatiner 1')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(providerValue.value),
                      ),
                      child: const Center(child: Text('Conatiner 1')),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
