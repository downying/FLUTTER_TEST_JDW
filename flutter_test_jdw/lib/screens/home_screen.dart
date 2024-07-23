import 'package:flutter/material.dart';
import 'package:flutter_test_jdw/screens/todo_list_screen.dart'; // Ensure this import is correct

class HomeScreen extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '🍀 todoList 앱 소개',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              '이 앱은 당신의 할 일 목록을 관리하는데 도움을 줍니다. 할 일 항목을 추가하고 완료된 작업을 체크할 수 있습니다.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TodoListScreen(),
                  ),
                );
              },
              child: const Text('시작하기'), // Updated to Korean
            ),
          ],
        ),
      ),
    );
  }
}
