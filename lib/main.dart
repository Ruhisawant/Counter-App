import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<int> _history = [];
  String _limitMessage = '';
  int _counter = 0;
  int _value = 1;
  int targetNum = 50;
  int min = 0;
  int max = 100;

  // Increment counter
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

  // Decrement counter
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

  // Reset counter, history, and other related variables
  void resetCounter() {
    setState(() {
      _counter = 0;
      _history.clear();
      _limitMessage = '';
      _value = 1;
    });
  }

  // Undo last counter change
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
        title: const Text('Counter App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  // Display the counter value with dynamic color based on the value
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: _counter == 0
                          ? Colors.red
                          : (_counter >= 50 ? Colors.green : Colors.black),
                    ),
                  ),
                  // Display limit message
                  if (_limitMessage.isNotEmpty)
                    Text(
                      _limitMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  // Display target reached message
                  if (_counter == targetNum)
                    const Text(
                      'You\'ve reached the target number!',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                ],
              ),

              const SizedBox(height: 30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Add Button
                      ElevatedButton(
                        onPressed: incrementCounter,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text('Add $_value', style: TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      
                      const SizedBox(height: 10),
                      
                      // Undo button
                      ElevatedButton(
                        onPressed: undoCounter,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                          backgroundColor: Colors.orangeAccent,
                        ),
                        child: const Text('Undo', style: TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                    ],
                  ),
                  
                  const SizedBox(width: 20),
                  
                  Column(
                    children: [
                      // Delete button
                      ElevatedButton(
                        onPressed: decrementCounter,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: Text('Delete $_value', style: TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                      
                      const SizedBox(height: 10),
                      
                      // Reset button
                      ElevatedButton(
                        onPressed: resetCounter,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 50),
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                          backgroundColor: Colors.redAccent,
                        ),
                        child: const Text('Reset', style: TextStyle(fontSize: 16, color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),
              
              // TextField to allow custom increment value
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Add Custom Increment Value',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (text) {
                  if (text.isNotEmpty) {
                    int enteredNumber = int.tryParse(text) ?? 0;
                    setState(() {
                      _value = enteredNumber;
                    });
                    _controller.clear();
                  }
                },
              ),

              const SizedBox(height: 20),

              // Slider to adjust the counter value
              Slider(
                min: 0,
                max: 100,
                value: _counter.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    _counter = value.toInt();
                  });
                },
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.redAccent,
              ),

              const SizedBox(height: 20),
              
              // History label
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'History:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 10),

              // History display
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _history.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${_history[index]}',
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}