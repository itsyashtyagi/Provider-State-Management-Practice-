import 'package:flutter/material.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management Provider'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: () {
                        _toggle.value = !_toggle.value;
                      },
                      child: Icon(_toggle.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                );
              }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Center(
                  child: Text(
                    _counter.value.toString(),
                    style: const TextStyle(fontSize: 40),
                  ),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
