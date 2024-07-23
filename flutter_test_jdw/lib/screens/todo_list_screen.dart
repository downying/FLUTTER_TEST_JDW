import 'package:flutter/material.dart';
import 'package:flutter_test_jdw/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_jdw/model/todo.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✨ Todo List'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
      ),
      body: Consumer<TodoModel>(
        builder: (context, todoModel, child) {
          final undoneTodos = todoModel.todos.where((todo) => !todo.isDone).toList();
          final doneTodos = todoModel.todos.where((todo) => todo.isDone).toList();

          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const Center(
                child: Text(
                  'To Do',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...undoneTodos.map((todo) {
                int index = todoModel.todos.indexOf(todo);
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(todo.title),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (bool? value) {
                        todoModel.toggleTodoStatus(index);
                      },
                      activeColor: Colors.purple,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        todoModel.deleteTodo(index);
                      },
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...doneTodos.map((todo) {
                int index = todoModel.todos.indexOf(todo);
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(
                      todo.title,
                      style: const TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (bool? value) {
                        todoModel.toggleTodoStatus(index);
                      },
                      activeColor: Colors.purple,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        todoModel.deleteTodo(index);
                      },
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddTodoDialog();
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

class AddTodoDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: '할 일을 입력하세요!'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('취소', style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              final todo = Todo(
                title: _controller.text,
              );
              Provider.of<TodoModel>(context, listen: false).addTodo(todo);
              Navigator.of(context).pop();
            }
          },
          child: const Text('추가'),
        ),
      ],
    );
  }
}
