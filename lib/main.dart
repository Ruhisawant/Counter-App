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
  int _value = 1;
  int min = 0;
  int max = 100;
  String _limitMessage = '';
  final List<int>_history = [];
  int targetNum = 50;

  void incrementCounter() {
    setState(() {
      if (_counter + _value <= max) {
        _counter += _value;
        _history.add(_counter);
      } else {
        _limitMessage = 'Maximum limit reached!';
      }
    });
  }

  void decrementCounter() {
    setState(() {
      if (_counter - _value >= min) {
        _counter -= _value;
        _history.add(_counter);
      } else {
        _limitMessage = 'Minimum limit reached!';
      }
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
      _history.clear();
    });
  }

  void undoCounter() {
    if (_history.isNotEmpty) {
      setState(() {
        _history.removeLast();
        _counter = _history.isNotEmpty ? _history.last : 0;
      });
    }
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
              child: Column(
                children: [
                  Text(
                    '$_counter', // displays the current number
                    style: TextStyle(
                      fontSize: 50.0,
                      color: _counter == 0
                          ? Colors.red
                          : (_counter >= 50 ? Colors.green : Colors.black),
                    ),
                  ),

                  if (_limitMessage.isNotEmpty) 
                    Text(
                      _limitMessage,
                      style: const TextStyle(color: Colors.red),
                    ),

                  if (_counter == targetNum) 
                    const Text(
                      'You\'ve reached the target number!',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                ],
              )
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

          ElevatedButton(
            onPressed: undoCounter,
            child: const Text('Undo'),
          ),

          TextField(
            decoration: const InputDecoration(
              labelText: 'Add Custom Increment Value',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                int enteredNumber = int.tryParse(text) ?? 0;
                setState(() {
                  _value = enteredNumber;
                });
              }
            }, // make the text box empty after submitted
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

          Expanded(
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Values: ${_history[index]}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}