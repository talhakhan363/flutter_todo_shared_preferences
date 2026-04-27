import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var taskController = TextEditingController();
  List<String> arrTasks = []; // --> we use this array for dynamic inputs
  static const String TASKS_KEY = "todo_list";

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() async {
    var sharedPref = await SharedPreferences.getInstance();
    setState(() {
      // --> getStringList retrieves the saved array. If null, empty array is assigned.
      arrTasks = sharedPref.getStringList(TASKS_KEY) ?? [];
    });
  }

  void _addTask() async {
    String newTask = taskController.text.toString().trim();

    if (newTask.isNotEmpty) {
      setState(() {
        arrTasks.add(newTask);
      });

      taskController.clear(); // --> empties the text field after adding

      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setStringList(TASKS_KEY, arrTasks); // --> saving the updated array to local storage
    }
  }

  @override
  void dispose() {
    taskController.dispose(); // --> free memory/resources you created
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        titleTextStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        title: const Text("To-Do List"),
      ),
      body: Column(
        children: [
          // --> Input Section using your specific styling patterns
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Enter new task...",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.blue.shade700, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.grey, width: 3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTask,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Add", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ),

          // --> List Display Section
          Expanded(
            child: arrTasks.isEmpty
                ? const Center(child: Text("No tasks yet. Add some!", style: TextStyle(fontSize: 18)))
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text('${index + 1}', style: const TextStyle(fontSize: 17)),
                        title: Text(arrTasks[index], style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                        trailing: const Icon(Icons.task_alt, color: Colors.blue),
                      );
                    },
                    itemCount: arrTasks.length,
                    separatorBuilder: (context, index) {
                      return const Divider(height: 8, thickness: 3); // --> from your listView.dart
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
