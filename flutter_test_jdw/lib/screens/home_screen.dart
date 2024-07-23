import 'package:flutter/material.dart';
import 'package:flutter_test_jdw/screens/todo_list_screen.dart'; // Ensure this import is correct

class HomeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Hex codes: #FFDB7B, #FFB8F0
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '이름을 입력해 주세요!'), // Updated to Korean
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                if (name.isNotEmpty) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => TodoListScreen(name: name),
                    ),
                  );
                }
              },
              child: const Text('작성하기'), // Updated to Korean
            ),
          ],
        ),
      ),
    );
  }
}
