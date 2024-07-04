import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> toDo = [
    {'task': 'Communication System Quiz', 'time': '10:00 AM'},
    {'task': 'OS Report', 'time': '11:00 AM'},
    {'task': 'Go to GYM', 'time': '12:00 PM'},
    {'task': 'Flutter Task', 'time': '2:00 PM'},
    {'task': 'Flutter Task بردو', 'time': '4:00 PM'},
  ];

  void deleteTask(int index) {
    setState(() {
      toDo.removeAt(index);
    });
  }

  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Task'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                deleteTask(index);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Task deleted')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4368FF),
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4368FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: toDo.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                toDo[index]['task']!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                toDo[index]['time']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () async {
                  showDeleteDialog(context, index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
