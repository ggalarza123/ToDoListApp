import 'package:flutter/material.dart';

class TaskListDetailPage extends StatefulWidget {
  const TaskListDetailPage({super.key, required this.title});

  final String title;

  @override
  State<TaskListDetailPage> createState() => _TaskListDetailPageState();
}

class _TaskListDetailPageState extends State<TaskListDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text("task list detail"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
