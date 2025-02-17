import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget', // Application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(), // A widget that will be started on the application startup
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0; //initial couter value

  void incrementCounter() {
    setState((){
      _counter++;
    });
  }
  void decrementCounter() {
    setState((){
      _counter--;
    });
  }
  void resetCounter() {
    setState((){
      _counter = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              child: Text(
                '$_counter', //displays the current number
                style: const TextStyle(fontSize: 50.0),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: incrementCounter,
            child: const Text('Add'),
          ),

          ElevatedButton(
            onPressed: decrementCounter,
            child: const Text('Delete'),
          ),

          ElevatedButton(
            onPressed: resetCounter,
            child: const Text('Reset'),
          ),

          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
              _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
        ],
      ),
    );
  }
}