class Task {
  final String name;
  final double price;
  bool isDone;

  Task({this.name, this.isDone = false, this.price});

  void toggleDone() {
    isDone = !isDone;
  }
}