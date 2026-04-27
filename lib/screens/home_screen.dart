import 'package:flutter/material.dart';
import 'counter_screen.dart';
import 'todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        titleTextStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        title: const Text("Week 2: Data Management"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // --> Navigating to Task 1 & 2
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterScreen()));
              },
              child: const Text("Counter App (Task 1 & 2)", style: TextStyle(fontSize: 19)),
            ),
            Container(height: 21), // --> Your custom spacing pattern
            ElevatedButton(
              onPressed: () {
                // --> Navigating to Task 3
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoScreen()));
              },
              child: const Text("To-Do List App (Task 3)", style: TextStyle(fontSize: 19)),
            ),
          ],
        ),
      ),
    );
  }
}
