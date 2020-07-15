import 'package:flutter/material.dart';
import 'package:fekrni/models/task.dart';
import 'package:provider/provider.dart';
import 'package:fekrni/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskproduct = TextEditingController();
  TextEditingController taskprice = TextEditingController();
  int Count = 1;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    taskproduct.dispose();
    taskprice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //String newTaskTitle = 'coffe';
    final counterModel = Provider.of<TaskData>(context, listen: false);

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: taskproduct,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Le Produite'),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              controller: taskprice,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'price probly',
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.orange,
                  child: Text('+',style: TextStyle(fontSize: 24),),
                  onPressed: () {
                    counterModel.incrementCounter();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Consumer<TaskData>(
                  builder: (context, model, child) {
                    final count = model.counter;
                    Count = count;
                    return Text(
                      '$count',
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                RaisedButton(
                  color: Colors.orange,
                  child: Text('-', style: TextStyle(fontSize: 32),),
                  onPressed: () {
                    //Provider.of<TaskData>(context).decrement(Count);
                    counterModel.decrementCounter();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange),
                  ),
                ),
              ],
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(taskproduct.text, double.parse(taskprice.text));
                Provider.of<TaskData>(context, listen: false).addTaskprice(double.parse(taskprice.text),Count); 
                //Provider.of<TaskData>(context, listen: false).listtotal();
                Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }
}
