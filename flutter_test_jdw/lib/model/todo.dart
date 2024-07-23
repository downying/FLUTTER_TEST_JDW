import 'package:flutter/foundation.dart';

class Todo {
  final String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].toggleDone();
    notifyListeners();
  }
}
