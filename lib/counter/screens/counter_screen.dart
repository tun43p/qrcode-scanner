import 'package:flutter/material.dart';
import 'package:qrcode_scanner/i18n/i18n.g.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({required this.title, super.key});

  final String title;

  static const String route = '/counter';

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(t.counter.pushed(times: _counter)),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: t.counter.increment,
          child: const Icon(Icons.add),
        ),
      );
}
