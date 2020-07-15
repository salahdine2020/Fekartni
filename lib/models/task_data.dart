import 'package:flutter/foundation.dart';
import 'package:fekrni/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  int counter;

  TaskData({this.counter = 1});

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void decrementCounter() {
    //counter--;
    if (counter > 1) {
      counter--;
    }
    notifyListeners();
  }

  List<Task> _tasks = [];
  List<double> l =[];
  double total =0;
  double t = 0;
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }
  double totalCount(){
     return t;
  }
  void addTask(String newTaskTitle, double newTaskPrice) {
    final task = Task(name: newTaskTitle, price: newTaskPrice);
    _tasks.add(task);
    notifyListeners();
  }
  addTaskprice (double pr, int c ){
    total = pr*c ;
    l.add(total);
    notifyListeners();
    return total;
  }
  subTaskprice (double pr, int c ){
    total = pr*c ;
    l.add(total);
    notifyListeners();
    return total;
  }
  double listtotal(){
    l.forEach((num e){t += e;});
    //var totale = total;
    notifyListeners();
    return t;
  }
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
