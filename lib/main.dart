import 'package:flutter/material.dart';
import 'package:fekrni/screen/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:fekrni/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        
        home: TasksScreen(),
      ),
    );
  }
}