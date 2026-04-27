import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  static const String COUNTER_KEY = "counter_value"; // --> static const var written in capital

  @override
  void initState() {
    super.initState();
    _loadCounter(); // --> retrieve data on app restart
  }

  // --> This function has async to wait for data loading
  void _loadCounter() async {
    var sharedPref = await SharedPreferences.getInstance();
    setState(() {
      // --> If null, defaults to 0
      _counter = sharedPref.getInt(COUNTER_KEY) ?? 0;
    });
  }

  // --> Function to increase counter and save it locally
  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setInt(COUNTER_KEY, _counter);
  }

  // --> Function to decrease counter and save it locally
  void _decrementCounter() async {
    setState(() {
      _counter--;
    });
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setInt(COUNTER_KEY, _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        titleTextStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Current Count:", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(
              "$_counter",
              style: TextStyle(fontSize: 40, color: Colors.blue.shade700, fontWeight: FontWeight.bold),
            ),
            Container(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text("Decrease", style: TextStyle(fontSize: 17)),
                ),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text("Increase", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
